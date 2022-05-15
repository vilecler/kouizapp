import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:kouizapp/services/auth_cognito.dart';
import 'package:kouizapp/widgets/buttons/socials/facebookbuttonwidget.dart';
import 'package:kouizapp/widgets/buttons/socials/googlebuttonwidget.dart';
import 'package:kouizapp/widgets/buttons/socials/kouizbuttonwidget.dart';
import 'package:kouizapp/widgets/kouizlogowidget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/customcolors.dart';

class SignUpKouizPage extends StatefulWidget {
  const SignUpKouizPage({Key? key}) : super(key: key);

  @override
  State<SignUpKouizPage> createState() => _SignUpKouizPageState();
}

class _SignUpKouizPageState extends State<SignUpKouizPage> {
  final AuthCognito authCognito = AuthCognito();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();

  void processSignUp(){
    if (_formKey.currentState!.validate()) {
      authCognito.signUp(_username.text, _password.text, _email.text);
    }
  }

  void signUp(){
    Navigator.pushReplacementNamed(context, '/signup');
  }

  String? passwordValidator(String? password){
    if(password == null || password.isEmpty){
      return 'Please provide a password.';
    }
    if(password.length < 8){
      return 'Password is too short (8 caracters minimum).';
    }
    return null;
  }

  String? confirmPasswordValidator(String? confirmPassword){
    if(confirmPassword == null || confirmPassword.isEmpty){
      return 'Please confirm your password.';
    }
    if(_confirmpassword.text != _password.text){
      return 'Passwords are not equal.';
    }
    return null;
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

        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: KouizLogoWidget(),
              ),

              const SizedBox(height: 40.0,),

              Material(
                color: CustomColors.transparent,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 35.0),
                        child: TextFormField(
                          autocorrect: false,
                          maxLength: 20,
                          maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                              labelText: "Username",
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              hintText: 'How do other people call you?',
                              counterText: "",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: CustomColors.white, width: 0.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: CustomColors.mainPurple, width: 2.5),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: CustomColors.mainRed, width: 2.5),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: CustomColors.mainRed, width: 2.5),
                              ),
                              fillColor: CustomColors.white,
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0)
                          ),
                          controller: _username,
                          validator: (username) { if(username!.isEmpty){ return 'Please provide an username.'; } else { return null; } },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 35.0),
                        child: TextFormField(
                          autocorrect: false,
                          maxLength: 70,
                          maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: "Email",
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              hintText: 'What is your email?',
                              counterText: "",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: CustomColors.white, width: 0.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: CustomColors.mainPurple, width: 2.5),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: CustomColors.mainRed, width: 2.5),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: CustomColors.mainRed, width: 2.5),
                              ),
                              fillColor: CustomColors.white,
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0)
                          ),
                          controller: _email,
                          validator: (email) { EmailValidator.validate(email!); },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 35.0),
                        child: TextFormField(
                          autocorrect: false,
                          maxLength: 70,
                          maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: "Password",
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              hintText: 'Please enter a password',
                              counterText: "",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: CustomColors.white, width: 0.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: CustomColors.mainPurple, width: 2.5),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: CustomColors.mainRed, width: 2.5),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: CustomColors.mainRed, width: 2.5),
                              ),
                              fillColor: CustomColors.white,
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0)
                          ),
                          controller: _password,
                          validator: passwordValidator,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 35.0),
                        child: TextFormField(
                          autocorrect: false,
                          maxLength: 70,
                          maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: "Confirm password",
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              hintText: 'Please reenter your password',
                              counterText: "",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: CustomColors.white, width: 0.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: CustomColors.mainPurple, width: 2.5),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: CustomColors.mainRed, width: 2.5),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: const BorderSide(color: CustomColors.mainRed, width: 2.5),
                              ),
                              fillColor: CustomColors.white,
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0)
                          ),
                          controller: _confirmpassword,
                          validator: confirmPasswordValidator,
                        ),
                      ),
                    ],
                  )
                ),
              ),

              const SizedBox(height: 20.0,),

              KouizButtonWidget(text: AppLocalizations.of(context)!.signUpWithKouiz, onTap: processSignUp,),

            ],
          ),
        ),

        GestureDetector(
          onTap: signUp,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(AppLocalizations.of(context)!.alreadyMember, style: const TextStyle(color: CustomColors.white, fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 17.0, decoration: TextDecoration.none),),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(AppLocalizations.of(context)!.back, style: const TextStyle(color: CustomColors.white, fontFamily: 'Roboto', fontWeight: FontWeight.w700, fontSize: 16.0, decoration: TextDecoration.none),),
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
