import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/widgets/boltwidget.dart';
import 'package:kouizapp/widgets/buttons/backgrounded/plainbuttonwidget.dart';
import 'package:kouizapp/widgets/hearders/backheaderwidget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/customcolors.dart';
import '../../../widgets/buttons/backgrounded/emptybuttonwidget.dart';

class QuizStartPage extends StatefulWidget {
  QuizStartPage({Key? key, required this.onPush, required this.hideBottomBarCallback, required this.displayBottomBarCallback}) : super(key: key);

  final Function onPush;
  final Function hideBottomBarCallback;
  final Function displayBottomBarCallback;

  @override
  State<QuizStartPage> createState() => _QuizStartPageState();
}

class _QuizStartPageState extends State<QuizStartPage> {

  void quizLobby(){

  }

  @override
  void initState() {
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

  void quizPlayground(){
    widget.onPush(context, '/quiz/playground');
  }

  @override
  Widget build(BuildContext context) {
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
              BackHeaderWidget(title: 'Geography', bolt: 100, white: true,),

              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top:40.0, bottom: 25.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Flags of the world',
                      style: TextStyle(color: CustomColors.white, fontSize: 20.0, fontWeight: FontWeight.w600, letterSpacing: 0.5),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 1.6, left: 3.0),
                      child: Text(
                        '/N°1',
                        style: TextStyle(color: CustomColors.fakeWhite, fontSize: 13.0, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0, bottom: 40.0),
                child: Text(
                  'The main flags of the world (Level 5)',
                  style: TextStyle(color: CustomColors.white, fontSize: 30.0, fontWeight: FontWeight.w700, letterSpacing: 1.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '5 questions',
                      style: TextStyle(color: CustomColors.white, fontSize: 18.0, fontWeight: FontWeight.w700),
                    ),
                    BoltWidget(number: 15, white: true,)
                  ],
                ),
              ),

              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 100.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PlainButtonWidget(icon: FontAwesomeIcons.play, text: 'Play now', onTap: quizPlayground),
                      EmptyButtonWidget(icon: FontAwesomeIcons.userFriends, text: 'Play with people'),
                      EmptyButtonWidget(icon: FontAwesomeIcons.arrowLeft, text: 'Back to selection'),
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
                      'Best score: 80%',
                      style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w600, letterSpacing: 0.5),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        '| See all statistics',
                        style: TextStyle(color: CustomColors.fakeWhite, fontSize: 14.0, fontWeight: FontWeight.w400, letterSpacing: 0.5),
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
