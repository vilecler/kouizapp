import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:kouizapp/constants/networking.dart';


class AuthCognito{
  final userPool = CognitoUserPool(
    Networking.userPoolId,
    Networking.clientId,
  );

  Future<void> signUp(String username, String password, String email) async {

    final userAttributes = [
      AttributeArg(name: 'custom:pseudo', value: username.trim()),
      AttributeArg(name: 'preferred_username', value: username.trim()),
    ];


    try {
      var data = await userPool.signUp(
        email,
        password,
        userAttributes: userAttributes,
      );
      print(data);

    } catch (e) {
      print(e);
    }

  }

}