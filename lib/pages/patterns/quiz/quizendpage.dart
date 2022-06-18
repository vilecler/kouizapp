import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/services/auth_cognito.dart' as auth;
import 'package:kouizapp/utils/translation.dart';
import 'package:kouizapp/widgets/buttons/backgrounded/plainbuttonwidget.dart';
import 'package:kouizapp/widgets/hearders/backheaderwidget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/customcolors.dart';
import '../../../models/quiz.dart';
import '../../../models/user.dart';
import '../../../widgets/buttons/backgrounded/emptybuttonwidget.dart';

class QuizEndPage extends StatefulWidget {
  const QuizEndPage({Key? key, required this.onPush, required this.hideBottomBarCallback, required this.displayBottomBarCallback}) : super(key: key);

  final Function onPush;
  final Function hideBottomBarCallback;
  final Function displayBottomBarCallback;

  @override
  State<QuizEndPage> createState() => _QuizEndPageState();
}

class _QuizEndPageState extends State<QuizEndPage> with TickerProviderStateMixin{
  User? currentUser;
  Quiz? quiz;
  String? categoryName;
  String? themeName;

  late AnimationController _progressController;

  @override
  void initState() {
    _progressController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 3),
        value: 0.8
    )..addListener(() {
      setState(() {
      });
    });
    super.initState();
    Future.delayed(Duration.zero, () async {
      widget.hideBottomBarCallback();
    });
  }

  @override
  void dispose(){
    super.dispose();
    Future.delayed(Duration.zero, () async {
      widget.displayBottomBarCallback();
    });
  }

  void loadUser() async{
    User user = await auth.getUser();
    setState(() {
      currentUser = user;
    });
  }

  void seeStatistics(){
    widget.onPush(context, '/quiz/end/recap', {});
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    quiz = arguments['quiz'];
    themeName = arguments['themeName'];
    categoryName = arguments['categoryName'];
    loadUser();

    return SafeArea(
      child: Stack(
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0,),
              BackHeaderWidget(title: categoryName!, bolt: (currentUser != null) ? currentUser!.energy : 0, white: true,),

              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top:25.0, bottom: 15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      themeName!,
                      style: const TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w600, letterSpacing: 0.5),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 1.6, left: 3.0),
                      child: Text(
                        (quiz!.themePosition != null) ? '/' + quiz!.themePosition! : '',
                        style: const TextStyle(color: CustomColors.fakeWhite, fontSize: 10.0, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0, bottom: 10.0),
                child: Text(
                  loadTranslation(quiz!.name),
                  style: const TextStyle(color: CustomColors.white, fontSize: 28.0, fontWeight: FontWeight.w700, letterSpacing: 1.0),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
                child: Center(
                  child: Text(
                    "80%",
                    style: const TextStyle(color: CustomColors.white, fontSize: 80.0, fontWeight: FontWeight.w800, letterSpacing: 1.0),
                  ),
                )
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Center(
                  child: Text(
                    "+200xp (Level Up)",
                    style: const TextStyle(color: CustomColors.white, fontSize: 18.0, fontWeight: FontWeight.w600, letterSpacing: 1.0),
                  ),
                )
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text('lvl ' + ((currentUser != null) ? currentUser!.getLevel().toString() : ""), style: const TextStyle(color: CustomColors.white, fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: 'Roboto', decoration: TextDecoration.none),),
                      ),
                      Flexible(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: LinearProgressIndicator(
                            value: _progressController.value,
                            minHeight: 10.0,
                            color: CustomColors.white,
                            backgroundColor: const Color(0xFFDEDDFF),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text('lvl ' + ((currentUser != null) ? (currentUser!.getLevel()  + 1).toString() : "") , style: const TextStyle(color: CustomColors.white, fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: 'Roboto', decoration: TextDecoration.none)),
                      ),
                    ],
                  ),
                ),
              ),

              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 70.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PlainButtonWidget(icon: FontAwesomeIcons.play, text: AppLocalizations.of(context)!.nextQuiz, onTap: (){}),
                      GestureDetector(onTap: (){
                        Navigator.pop(context);
                      },
                          child: EmptyButtonWidget(icon: FontAwesomeIcons.arrowLeft, text: AppLocalizations.of(context)!.backToSelection)
                      ),
                    ],
                  ),
                ),
              )

            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      end: FractionalOffset.topRight,
                      begin: FractionalOffset.bottomLeft,
                      colors: [
                        CustomColors.mainPurple.withOpacity(0.6),
                        CustomColors.mainPink.withOpacity(0.6),
                      ],
                      stops: const [0.0, 1.0]
                  ),
                ),
                height: 60.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: seeStatistics,
                      child: Text(
                        AppLocalizations.of(context)!.seeAllStatistics,
                        style: const TextStyle(color: CustomColors.white, fontSize: 14.0, fontWeight: FontWeight.w600, letterSpacing: 0.5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        '| ' + AppLocalizations.of(context)!.playAgain,
                        style: const TextStyle(color: CustomColors.fakeWhite, fontSize: 12.0, fontWeight: FontWeight.w400, letterSpacing: 0.5),
                      ),
                    )
                  ],
                ),
              )

            ],
          )

        ],
      ),
    );
  }
}
