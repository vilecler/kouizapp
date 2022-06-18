import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/services/auth_cognito.dart' as auth;
import 'package:kouizapp/utils/translation.dart';
import 'package:kouizapp/widgets/buttons/backgrounded/plainbuttonwidget.dart';
import 'package:kouizapp/widgets/hearders/backheaderwidget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kouizapp/widgets/searchboxwidget.dart';

import '../../../constants/customcolors.dart';
import '../../../models/quiz.dart';
import '../../../models/user.dart';
import '../../../widgets/buttons/backgrounded/emptybuttonwidget.dart';

class QuizLobbyPage extends StatefulWidget {
  const QuizLobbyPage({Key? key, required this.onPush, required this.hideBottomBarCallback, required this.displayBottomBarCallback}) : super(key: key);

  final Function onPush;
  final Function hideBottomBarCallback;
  final Function displayBottomBarCallback;

  @override
  State<QuizLobbyPage> createState() => _QuizLobbyPageState();
}

class _QuizLobbyPageState extends State<QuizLobbyPage> {
  User? currentUser;
  Quiz? quiz;
  String? categoryName;
  String? themeName;

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
    widget.onPush(context, '/quiz/playground', {});
  }

  void quizLobbyInvite(){
    widget.onPush(context, '/quiz/lobby/invite', {});
  }

  void loadUser() async{
    User user = await auth.getUser();
    setState(() {
      currentUser = user;
    });
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
              BackHeaderWidget(title: 'Lobby', bolt: (currentUser != null) ? currentUser!.energy : 0, white: true,),

              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 25.0, bottom: 15.0),
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
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0, bottom: 15.0),
                child: Text(
                  loadTranslation(quiz!.name),
                  style: const TextStyle(color: CustomColors.white, fontSize: 28.0, fontWeight: FontWeight.w700, letterSpacing: 1.0),
                ),
              ),


              Material(
                color: CustomColors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Flexible(
                      child: SearchBoxWidget(white: true),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0, bottom: 4.0),
                      child: GestureDetector(
                        onTap: quizLobbyInvite,
                        child: const FaIcon(FontAwesomeIcons.userPlus, color: CustomColors.white, size: 22.0,)
                      ),
                    ),
                  ],
                ),
              ),

              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 120.0),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '@petitstring',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                ),
                                Text(
                                  'Ready',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                )
                              ],
                            ),
                          ),Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '@robert',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                ),
                                Text(
                                  'Not ready',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                )
                              ],
                            ),
                          ),Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '@gertude',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                ),
                                Text(
                                  'Ready',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '@hugue',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                ),
                                Text(
                                  'Invited',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                )
                              ],
                            ),
                          ),Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '@jeanclaude',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                ),
                                Text(
                                  'Ready',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                )
                              ],
                            ),
                          ),Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '@petitstring',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                ),
                                Text(
                                  'Ready',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                )
                              ],
                            ),
                          ),Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '@petitstring',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                ),
                                Text(
                                  'Ready',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                )
                              ],
                            ),
                          ),Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '@ines',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                ),
                                Text(
                                  'Ready',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                )
                              ],
                            ),
                          ),Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '@fromage',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                ),
                                Text(
                                  'Ready',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                )
                              ],
                            ),
                          ),Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '@petitstring',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                ),
                                Text(
                                  'Ready',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                )
                              ],
                            ),
                          ),Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '@petitstring',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                ),
                                Text(
                                  'Ready',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                )
                              ],
                            ),
                          ),Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '@bruh',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                ),
                                Text(
                                  'Ready',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                )
                              ],
                            ),
                          ),Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '@petitstring',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                ),
                                Text(
                                  'Ready',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                )
                              ],
                            ),
                          ),Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '@petitstring',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                ),
                                Text(
                                  'Ready',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                )
                              ],
                            ),
                          ),Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '@petitstring',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                ),
                                Text(
                                  'Ready',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                )
                              ],
                            ),
                          ),Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '@petitstring',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                ),
                                Text(
                                  'Ready',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                )
                              ],
                            ),
                          ),Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '@petitstring',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                ),
                                Text(
                                  'Ready',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                )
                              ],
                            ),
                          ),Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '@petitstring',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                ),
                                Text(
                                  'Ready',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                )
                              ],
                            ),
                          ),Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '@petitstring',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                ),
                                Text(
                                  'Ready',
                                  style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.25),
                                )
                              ],
                            ),
                          ),

                        ]
                      ),
                    ),
                  ),
                ),
              ),



            ],
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "2/3 participants",
                    style: TextStyle(color: CustomColors.white, fontSize: 20.0, fontWeight: FontWeight.w700, letterSpacing: 0.25),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 7.0),
                        child: Text(
                          "Start anyway",
                          style: TextStyle(color: CustomColors.white, fontSize: 20.0, fontWeight: FontWeight.w700, letterSpacing: 0.25),
                        ),
                      ),
                      FaIcon(FontAwesomeIcons.arrowRight, color: CustomColors.white, size: 16,)
                    ],
                  )
                ],
              ),
            ),
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
                      "Set not ready",
                      style: const TextStyle(color: CustomColors.white, fontSize: 14.0, fontWeight: FontWeight.w600, letterSpacing: 0.5),
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
