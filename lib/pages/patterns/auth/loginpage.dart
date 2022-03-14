import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kouizapp/widgets/buttons/socials/facebookbuttonwidget.dart';
import 'package:kouizapp/widgets/buttons/socials/googlebuttonwidget.dart';
import 'package:kouizapp/widgets/buttons/socials/kouizbuttonwidget.dart';
import 'package:kouizapp/widgets/kouizlogowidget.dart';

import '../../../constants/customcolors.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  void loginCompleted(){
    Navigator.pushReplacementNamed(context, '/main');
  }

  void signUp(){
    Navigator.pushReplacementNamed(context, '/signup');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: CustomColors.mainPurple,
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  'assets/images/background_texture.png'
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                end: FractionalOffset.topRight,
                begin: FractionalOffset.bottomLeft,
                colors: [
                  CustomColors.mainPink,
                  CustomColors.white.withOpacity(0.0),
                ],
                stops: const [0.0, 1.0]
            ),
          ),
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: KouizLogoWidget(),
            ),

            SizedBox(
              height: 80.0,
            ),

            FacebookButtonWidget(text: 'Login with Facebook', onTap: loginCompleted),
            GoogleButtonWidget(text: 'Login with Google', onTap: loginCompleted),
            KouizButtonWidget(text: 'Login with Kouiz', onTap: loginCompleted),

          ],
        ),

        GestureDetector(
          onTap: signUp,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Not a member yet?', style: const TextStyle(color: CustomColors.white, fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 17.0, decoration: TextDecoration.none),),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text('Sign up', style: const TextStyle(color: CustomColors.white, fontFamily: 'Roboto', fontWeight: FontWeight.w700, fontSize: 16.0, decoration: TextDecoration.none),),
                  ),
                ],
              ),
            ),
          ),
        )

      ],
    );
  }
}
