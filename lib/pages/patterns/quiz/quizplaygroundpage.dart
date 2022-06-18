import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kouizapp/widgets/quiz/answerwidget.dart';

import '../../../constants/customcolors.dart';
import '../../../models/quiz.dart';

class QuizPlaygroundPage extends StatefulWidget {
  QuizPlaygroundPage({Key? key, required this.onPush, required this.hideBottomBarCallback, required this.displayBottomBarCallback}) : super(key: key);

  final Function onPush;
  final Function hideBottomBarCallback;
  final Function displayBottomBarCallback;

  @override
  State<QuizPlaygroundPage> createState() => _QuizPlaygroundPageState();
}

class _QuizPlaygroundPageState extends State<QuizPlaygroundPage> {
  Quiz? quiz;
  String? categoryName;
  String? themeName;

  void quizLobby(){

  }

  void quizEnd(){
    widget.onPush(context, '/quiz/end', {'quiz': quiz, 'themeName': themeName, 'categoryName': categoryName});
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      widget.hideBottomBarCallback();
    });
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    quiz = arguments['quiz'];
    themeName = arguments['themeName'];
    categoryName = arguments['categoryName'];

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
              LinearProgressIndicator(
                value: 0.7,
                color: CustomColors.fakeWhite,
                backgroundColor: CustomColors.transparent,
                minHeight: 7.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 0.0),
                child: Center(
                  child: Text(
                    'Time remaining: 2s',
                    style: TextStyle(color: CustomColors.white, fontWeight: FontWeight.w500, letterSpacing: 0.25, fontSize: 10.0),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 5.0),
                child: Text(
                  'The main flags of the world (Level 5)',
                  style: TextStyle(color: CustomColors.white, fontSize: 12.0, fontWeight: FontWeight.w400, letterSpacing: 0.5),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0, bottom: 25.0),
                child: Text(
                  'Question 1/5',
                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w600, letterSpacing: 1.0),
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0, bottom: 0.0),
                child: Text(
                  'To which country belongs this flag?',
                  style: TextStyle(color: CustomColors.white, fontSize: 30.0, fontWeight: FontWeight.w700, letterSpacing: 1.0),
                ),
              ),



              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Center(
                        child: SvgPicture.asset("assets/images/flagofalbania.svg", matchTextDirection: false, alignment: Alignment.topCenter, height: 200.0),
                      ),
                      SizedBox(height: 40.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: quizEnd,
                            child: AnswerWidget(answer: 'Albania')
                          ),
                          AnswerWidget(answer: 'Albania'),
                        ],
                      ),
                      SizedBox(height: 15.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnswerWidget(answer: 'Albania'),
                          AnswerWidget(answer: 'Albania'),
                        ],
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
                    Text(
                      'Current score: 80%',
                      style: TextStyle(color: CustomColors.white, fontSize: 14.0, fontWeight: FontWeight.w600, letterSpacing: 0.5),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        '| Please select an answer',
                        style: TextStyle(color: CustomColors.fakeWhite, fontSize: 12.0, fontWeight: FontWeight.w400, letterSpacing: 0.5),
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
