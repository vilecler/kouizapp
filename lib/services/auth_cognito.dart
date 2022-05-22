import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:kouizapp/constants/networking.dart';


class AuthCognito{
  final userPool = CognitoUserPool(
    Networking.userPoolId,
    Networking.clientId,
  );

  Future<String> signUp(String username, String password, String email) async {

    final userAttributes = [
      AttributeArg(name: 'custom:pseudo', value: username.trim()),
      AttributeArg(name: 'preferred_username', value: username.trim()),
      AttributeArg(name: 'email', value: email.trim()),
    ];


    try {
      await userPool.signUp(
        email,
        password,
        userAttributes: userAttributes,
      );

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

      //TODO: Save email in internal storage because object CognitoUser only requires email (not to reauth each time the app is relaunched).
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
    return false;
  }
}