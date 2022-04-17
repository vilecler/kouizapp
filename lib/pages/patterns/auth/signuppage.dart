import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kouizapp/widgets/buttons/socials/facebookbuttonwidget.dart';
import 'package:kouizapp/widgets/buttons/socials/googlebuttonwidget.dart';
import 'package:kouizapp/widgets/buttons/socials/kouizbuttonwidget.dart';
import 'package:kouizapp/widgets/kouizlogowidget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/customcolors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  void loginCompleted(){
    Navigator.pushReplacementNamed(context, '/main');
  }

  void login(){
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
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

              const SizedBox(
                height: 80.0,
              ),

              FacebookButtonWidget(text: AppLocalizations.of(context)!.signUpWithFacebook, onTap: loginCompleted,),
              GoogleButtonWidget(text: AppLocalizations.of(context)!.signUpWithGoogle, onTap: loginCompleted,),
              KouizButtonWidget(text: AppLocalizations.of(context)!.signUpWithKouiz, onTap: loginCompleted,),

            ],
          ),

          GestureDetector(
            onTap: login,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(AppLocalizations.of(context)!.alreadyMember, style: const TextStyle(color: CustomColors.white, fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 17.0, decoration: TextDecoration.none),),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(AppLocalizations.of(context)!.login, style: const TextStyle(color: CustomColors.white, fontFamily: 'Roboto', fontWeight: FontWeight.w700, fontSize: 16.0, decoration: TextDecoration.none),),
                    ),
                  ],
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
