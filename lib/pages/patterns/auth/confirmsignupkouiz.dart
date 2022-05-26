import 'package:bottom_loader/bottom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:kouizapp/services/auth_cognito.dart' as auth;
import 'package:kouizapp/widgets/buttons/socials/kouizbuttonwidget.dart';
import 'package:kouizapp/widgets/kouizlogowidget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/customcolors.dart';

class ConfirmSignUpKouizPage extends StatefulWidget {
  const ConfirmSignUpKouizPage({Key? key}) : super(key: key);

  @override
  State<ConfirmSignUpKouizPage> createState() => _ConfirmSignUpKouizPageState();
}

class _ConfirmSignUpKouizPageState extends State<ConfirmSignUpKouizPage> {
  final _formKey = GlobalKey<FormState>();

  String? email;

  final TextEditingController _verificationCode = TextEditingController();

  void processVerification() async {
    BottomLoader bl = BottomLoader(
      context,
      showLogs: true,
      isDismissible: true,
    );
    bl.style(
      message: AppLocalizations.of(context)!.confirmingVerificationCode + '...',
    );

    if (!_formKey.currentState!.validate()) { //If form is not valid do nothing
      return;
    }

    if (email == null){
      back();
      return;
    }

    await bl.display();
    bool result = await auth.confirmSignUp(email!, _verificationCode.text);
    bl.close();

    if (result){
      Navigator.pushReplacementNamed(context, '/main');
      return;
    }

   return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.badCode),
        content: Text(AppLocalizations.of(context)!.badCodeDescription),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: Text(AppLocalizations.of(context)!.close),
          ),
        ],
      ),
    );
  }

  void resendCode() async{
    BottomLoader bl = BottomLoader(
      context,
      showLogs: true,
      isDismissible: true,
    );
    bl.style(
      message: AppLocalizations.of(context)!.confirmingVerificationCode + '...',
    );

    if (email == null){
      back();
      return;
    }

    await bl.display();
    var result = await auth.resendConfirmationCode(email!);
    bl.close();

    if(result != false){
      return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(AppLocalizations.of(context)!.newCodeSent),
          content: Text(AppLocalizations.of(context)!.newCodeSentTo + ' ' + email! + '.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: Text(AppLocalizations.of(context)!.close),
            ),
          ],
        ),
      );
    }

    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.codeError),
        content: Text(AppLocalizations.of(context)!.codeUnknownError),
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

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    email = arguments['email'];

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
                            maxLength: 6,
                            maxLengthEnforcement: MaxLengthEnforcement.truncateAfterCompositionEnds,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)!.code,
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                                hintText: AppLocalizations.of(context)!.codePlaceholder,
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
                            controller: _verificationCode,
                            validator: (code) { if(code!.isEmpty || code.length < 6){ return AppLocalizations.of(context)!.codeNotValid; } else { return null; } },
                          ),
                        ),
                      ],
                    ),
                ),
              ),

              const SizedBox(height: 20.0,),

              KouizButtonWidget(text: AppLocalizations.of(context)!.signUpWithKouiz, onTap: processVerification,),

            ],
          ),
        ),

        GestureDetector(
          onTap: resendCode,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(AppLocalizations.of(context)!.codeNotReceived, style: const TextStyle(color: CustomColors.white, fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 17.0, decoration: TextDecoration.none),),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(AppLocalizations.of(context)!.resendCode, style: const TextStyle(color: CustomColors.white, fontFamily: 'Roboto', fontWeight: FontWeight.w700, fontSize: 16.0, decoration: TextDecoration.none),),
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
