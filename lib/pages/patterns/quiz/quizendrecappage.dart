import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/services/auth_cognito.dart' as auth;
import 'package:kouizapp/utils/translation.dart';
import 'package:kouizapp/widgets/buttons/backgrounded/plainbuttonwidget.dart';
import 'package:kouizapp/widgets/hearders/backheaderwidget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kouizapp/widgets/hearders/hearderwidget.dart';

import '../../../constants/customcolors.dart';
import '../../../models/quiz.dart';
import '../../../models/user.dart';
import '../../../widgets/buttons/backgrounded/emptybuttonwidget.dart';

class QuizEndRecapPage extends StatefulWidget {
  const QuizEndRecapPage({Key? key, required this.onPush, required this.hideBottomBarCallback, required this.displayBottomBarCallback}) : super(key: key);

  final Function onPush;
  final Function hideBottomBarCallback;
  final Function displayBottomBarCallback;

  @override
  State<QuizEndRecapPage> createState() => _QuizEndRecapPageState();
}

class _QuizEndRecapPageState extends State<QuizEndRecapPage>{
  User? currentUser;

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

  void loadUser() async{
    User user = await auth.getUser();
    setState(() {
      currentUser = user;
    });
  }

  void seeStatistics(){
    widget.onPush(context, '/quiz/stats', {});
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
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
              BackHeaderWidget(title: "Statistics", bolt: (currentUser != null) ? currentUser!.energy : 0, white: true,),

              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0, bottom: 0.0),
                child: Text(
                  "Average score: 53%",
                  style: const TextStyle(color: CustomColors.white, fontSize: 24.0, fontWeight: FontWeight.w600, letterSpacing: 1.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 35.0),
                child: Text(
                  "You belong to the best 36% players for this quiz.",
                  style: const TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w400, letterSpacing: 0.5,),
                ),
              ),

              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 60.0),
                  child: SingleChildScrollView(
                    child: ExpansionPanelList(
                      expandedHeaderPadding: EdgeInsets.zero,

                      children: [
                        ExpansionPanel(
                          headerBuilder: (BuildContext context, bool isExpanded) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Question 1",
                                    style: TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 18.0, fontWeight: FontWeight.w600)
                                  ),
                                  FaIcon(FontAwesomeIcons.times, color: CustomColors.mainRed, size: 22,)
                                ],
                              ),
                            );
                          },
                          body: Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 40.0, bottom: 20.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "To which country belong this flag?",
                                      style: TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 20.0, fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Correct answer:',
                                        style: TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 14.0, fontWeight: FontWeight.w500),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          'Albania',
                                          style: TextStyle(color: CustomColors.mainGreen, fontFamily: 'Roboto', fontSize: 14.0, fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0, bottom: 20.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Your answer:',
                                        style: TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 14.0, fontWeight: FontWeight.w500),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          'Russia',
                                          style: TextStyle(color: CustomColors.mainRed, fontFamily: 'Roboto', fontSize: 14.0, fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          isExpanded: true,
                          canTapOnHeader: true
                        ),
                        ExpansionPanel(
                          
                            headerBuilder: (BuildContext context, bool isExpanded) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "Question 2",
                                        style: TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 18.0, fontWeight: FontWeight.w600)
                                    ),
                                    FaIcon(FontAwesomeIcons.times, color: CustomColors.mainRed, size: 22,)
                                  ],
                                ),
                              );
                            },
                            body: Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 40.0, bottom: 20.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "To which country belong this flag?",
                                        style: TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 20.0, fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Correct answer:',
                                          style: TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 14.0, fontWeight: FontWeight.w500),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            'Albania',
                                            style: TextStyle(color: CustomColors.mainGreen, fontFamily: 'Roboto', fontSize: 14.0, fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0, bottom: 20.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Your answer:',
                                          style: TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 14.0, fontWeight: FontWeight.w500),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            'Russia',
                                            style: TextStyle(color: CustomColors.mainRed, fontFamily: 'Roboto', fontSize: 14.0, fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            isExpanded: false,
                            canTapOnHeader: true
                        ),
                        ExpansionPanel(
                            headerBuilder: (BuildContext context, bool isExpanded) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "Question 3",
                                        style: TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 18.0, fontWeight: FontWeight.w600)
                                    ),
                                    FaIcon(FontAwesomeIcons.check, color: CustomColors.mainGreen, size: 22,)
                                  ],
                                ),
                              );
                            },
                            body: Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 40.0, bottom: 20.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "To which country belong this flag?",
                                        style: TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 20.0, fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Correct answer:',
                                          style: TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 14.0, fontWeight: FontWeight.w500),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            'Albania',
                                            style: TextStyle(color: CustomColors.mainGreen, fontFamily: 'Roboto', fontSize: 14.0, fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0, bottom: 20.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Your answer:',
                                          style: TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 14.0, fontWeight: FontWeight.w500),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            'Albania',
                                            style: TextStyle(color: CustomColors.mainGreen, fontFamily: 'Roboto', fontSize: 14.0, fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            isExpanded: true,
                            canTapOnHeader: true
                        ),
                        ExpansionPanel(
                            headerBuilder: (BuildContext context, bool isExpanded) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "Question 4",
                                        style: TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 18.0, fontWeight: FontWeight.w600)
                                    ),
                                    FaIcon(FontAwesomeIcons.times, color: CustomColors.mainRed, size: 22,)
                                  ],
                                ),
                              );
                            },
                            body: Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 40.0, bottom: 20.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "To which country belong this flag?",
                                        style: TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 20.0, fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Correct answer:',
                                          style: TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 14.0, fontWeight: FontWeight.w500),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            'Albania',
                                            style: TextStyle(color: CustomColors.mainGreen, fontFamily: 'Roboto', fontSize: 14.0, fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0, bottom: 20.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Your answer:',
                                          style: TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 14.0, fontWeight: FontWeight.w500),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            'Russia',
                                            style: TextStyle(color: CustomColors.mainRed, fontFamily: 'Roboto', fontSize: 14.0, fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            isExpanded: true,
                            canTapOnHeader: true
                        ),
                        ExpansionPanel(
                            headerBuilder: (BuildContext context, bool isExpanded) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "Question 5",
                                        style: TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 18.0, fontWeight: FontWeight.w600)
                                    ),
                                    FaIcon(FontAwesomeIcons.times, color: CustomColors.mainRed, size: 22,)
                                  ],
                                ),
                              );
                            },
                            body: Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 40.0, bottom: 20.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "To which country belong this flag?",
                                        style: TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 20.0, fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Correct answer:',
                                          style: TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 14.0, fontWeight: FontWeight.w500),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            'Albania',
                                            style: TextStyle(color: CustomColors.mainGreen, fontFamily: 'Roboto', fontSize: 14.0, fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0, bottom: 20.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Your answer:',
                                          style: TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 14.0, fontWeight: FontWeight.w500),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            'Russia',
                                            style: TextStyle(color: CustomColors.mainRed, fontFamily: 'Roboto', fontSize: 14.0, fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            isExpanded: false,
                            canTapOnHeader: true
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),



          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
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
                        "Your score: 80%",
                        style: const TextStyle(color: CustomColors.white, fontSize: 14.0, fontWeight: FontWeight.w600, letterSpacing: 0.5),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          '| Back',
                          style: const TextStyle(color: CustomColors.fakeWhite, fontSize: 12.0, fontWeight: FontWeight.w400, letterSpacing: 0.5),
                        ),
                      )
                    ],
                  ),
                ),
              )

            ],
          )

        ],
      ),
    );
  }
}
