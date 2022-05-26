import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kouizapp/constants/networking.dart';
import 'package:kouizapp/errors/loginrequiredexception.dart';

import '../models/user.dart';

final storage = FlutterSecureStorage();

final userPool = CognitoUserPool(
  Networking.userPoolId,
  Networking.clientId,
);

User? currentUser;
DateTime? lastUserRefresh;

Future<User> getUser() async{
  //Creating user and wait for it
  if(currentUser == null){
    lastUserRefresh = DateTime.now();
    return await _refreshUser();
  }

  //Chack if refresh is required, if it is the case, returns the previous user and ask for a refresh
  if(lastUserRefresh != null && DateTime
      .now()
      .difference(lastUserRefresh!)
      .inSeconds > 5) {
    lastUserRefresh = DateTime.now();
    _refreshUser();
  }

  return currentUser!;
}

Future<User> _refreshUser() async{
  String? email = await storage.read(key: 'email');
  String? password = await storage.read(key: 'password');

  if(email == null || password == null){
    throw LoginRequiredException('Credentials not found.');
  }

  final cognitoUser = CognitoUser(email, userPool);
  final authDetails = AuthenticationDetails(
    username: email,
    password: password,
  );

  try {
    await cognitoUser.authenticateUser(authDetails);
    List<CognitoUserAttribute>? attributes = await cognitoUser.getUserAttributes();

    if(attributes == null){
      throw LoginRequiredException('No attribute found.');
    }

    String? sub;
    String? username;
    String? pseudo;
    String? email;
    int? energy;
    int? experience;

    for (CognitoUserAttribute attribute in attributes) {
      switch(attribute.getName()){
        case 'sub':
          sub = attribute.getValue();
          break;
        case 'preferred_username':
          username = attribute.getValue();
          break;
        case 'custom:pseudo':
          pseudo = attribute.getValue();
          break;
        case 'email':
          email = attribute.getValue();
          break;
        case 'custom:energy':
          energy = int.parse(attribute.getValue() ?? '0');
          break;
        case 'custom:experience':
          experience = int.parse(attribute.getValue() ?? '0');
          break;
      }
    }

    if(sub == null || username == null || pseudo == null || email == null || energy == null || experience == null){
      throw Exception('One attribute is missing.');
    }

    currentUser = User(sub: sub, username: username, pseudo: pseudo, email: email, energy: energy, experience: experience);
    return currentUser!;
  } on CognitoClientException catch (e) {
    // User find but credentials are not valid, need to ask user an other account
    if (e.code == 'UserNotFoundException' || e.code == 'NotAuthorizedException'){
      throw LoginRequiredException('User found is not valid.');
    }
    rethrow;
  } catch (e) {
    rethrow;
  }
}

Future<String> login(String email, String password) async{
  final cognitoUser = CognitoUser(email, userPool);
  final authDetails = AuthenticationDetails(
    username: email,
    password: password,
  );

  try {
    await cognitoUser.authenticateUser(authDetails);
    //Save email and password in internal storage because object CognitoUser only requires email (not to reauth each time the app is relaunched).
    await saveEmail(email);
    await savePassword(password);

    return 'success';
  } on CognitoClientException catch (e) {
    return e.code!;
  }catch (e) {
    rethrow;
  }
}

Future<String> signUp(String username, String password, String email) async {

  final userAttributes = [
    AttributeArg(name: 'custom:pseudo', value: username.trim()),
    AttributeArg(name: 'preferred_username', value: username.trim()),
    AttributeArg(name: 'email', value: email.trim()),
    const AttributeArg(name: 'custom:energy', value: '100'),
    const AttributeArg(name: 'custom:experience', value: '0'),
  ];

  try {
    await userPool.signUp(
      email,
      password,
      userAttributes: userAttributes,
    );

    //Save password
    await savePassword(password);
    return 'success';
  } on CognitoClientException catch(e) {
    return e.code!;
  } catch (e) {
    rethrow;
  }
}

Future<bool> confirmSignUp(String email, String code) async {
  final cognitoUser = CognitoUser(email, userPool);

  bool registrationConfirmed = false;
  try {
    registrationConfirmed = await cognitoUser.confirmRegistration(code);

    //Save email in internal storage because object CognitoUser only requires email (not to reauth each time the app is relaunched).
    await saveEmail(email);
  }  on CognitoClientException catch(e) {
    if (e.code == 'CodeMismatchException') {
      registrationConfirmed = false;
    }
  } catch (e) {
    rethrow;
  }
  return registrationConfirmed;
}

Future<dynamic> resendConfirmationCode(String email) async{
  final cognitoUser = CognitoUser(email, userPool);

  try {
    return await cognitoUser.resendConfirmationCode();
  } catch (e) {
    rethrow;
  }
}

Future<void> saveEmail(String email) async{
  //Save email locally to be able to retrieve user if needed.
  await storage.write(key: 'email', value: email);
  print('Email ' + email + ' saved in cache.');
  return;
}

Future<void> savePassword(String password) async{
  //Save email locally to be able to retrieve user if needed.
  await storage.write(key: 'password', value: password);
  print('Password ' + password + ' saved in cache.');
  return;
}

Future<void> disconnect() async{
  String? email = await storage.read(key: 'email');
  String? password = await storage.read(key: 'password');

  if(email == null || password == null){
    return;
  }
  final cognitoUser = CognitoUser(email, userPool);
  await cognitoUser.signOut();
  await storage.deleteAll();
  return;
}