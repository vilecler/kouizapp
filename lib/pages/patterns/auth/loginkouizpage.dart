import 'package:bottom_loader/bottom_loader.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:kouizapp/services/auth_cognito.dart' as auth;
import 'package:kouizapp/widgets/buttons/socials/kouizbuttonwidget.dart';
import 'package:kouizapp/widgets/kouizlogowidget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/customcolors.dart';

class LoginKouizPage extends StatefulWidget {
  const LoginKouizPage({Key? key}) : super(key: key);

  @override
  State<LoginKouizPage> createState() => _LoginKouizPageState();
}

class _LoginKouizPageState extends State<LoginKouizPage> {
  final _formKey = GlobalKey<FormState>();


  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();


  void processLogin(BuildContext context) async {
    BottomLoader bl = BottomLoader(
      context,
      showLogs: true,
      isDismissible: true,
    );
    bl.style(
      message: AppLocalizations.of(context)!.processingLogin + '...',
    );

    if (!_formKey.currentState!.validate()) { //If form is not valid do nothing
      return;
    }

    await bl.display();
    String result = await auth.login(_email.text, _password.text);
    bl.close();

    if (result == 'success'){
      //Load new page
      Navigator.pushReplacementNamed(context, '/main');
      return;
    }

    String errorMessage = 'Unknown error';
    switch(result){
      case 'NotAuthorizedException':
        errorMessage = AppLocalizations.of(context)!.notAuthorizedException;
        break;
      case 'UserNotFoundException':
        errorMessage = AppLocalizations.of(context)!.userNotFoundException;
        break;
    }

    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.loginError),
        content: Text(errorMessage),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: Text(AppLocalizations.of(context)!.close),
          ),
        ],
      ),
    );

  }

  void back(){
    Navigator.pop(context);
  }

  String? passwordValidator(String? password){
    if(password == null || password.isEmpty){
      return AppLocalizations.of(context)!.pleaseProvideAPassword;
    }
    if(password.length < 8){
      return AppLocalizations.of(context)!.passwordTooShort;
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
                            maxLength: 70,
                            maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)!.email,
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                                hintText: AppLocalizations.of(context)!.emailPlaceholder,
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
                                labelText: AppLocalizations.of(context)!.password,
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                                hintText: AppLocalizations.of(context)!.passwordPlaceholder,
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

                      ],
                    )
                ),
              ),

              const SizedBox(height: 20.0,),

              KouizButtonWidget(text: AppLocalizations.of(context)!.loginWithKouiz, onTap: () { processLogin(context); },),

            ],
          ),
        ),

        GestureDetector(
          onTap: back,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(AppLocalizations.of(context)!.notAMemberYet, style: const TextStyle(color: CustomColors.white, fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 17.0, decoration: TextDecoration.none),),
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
