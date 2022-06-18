import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/services/auth_cognito.dart' as auth;
import 'package:kouizapp/utils/translation.dart';
import 'package:kouizapp/widgets/buttons/backgrounded/plainbuttonwidget.dart';
import 'package:kouizapp/widgets/hearders/backheaderwidget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kouizapp/widgets/hearders/hearderwidget.dart';
import 'package:kouizapp/widgets/searchboxwidget.dart';
import 'package:kouizapp/widgets/titles/mediumtitlewidget.dart';

import '../../../constants/customcolors.dart';
import '../../../models/quiz.dart';
import '../../../models/user.dart';

class QuizStartStatisticsPage extends StatefulWidget {
  const QuizStartStatisticsPage({Key? key, required this.onPush, required this.hideBottomBarCallback, required this.displayBottomBarCallback}) : super(key: key);

  final Function onPush;
  final Function hideBottomBarCallback;
  final Function displayBottomBarCallback;

  @override
  State<QuizStartStatisticsPage> createState() => _QuizStartStatisticsPageState();
}

class _QuizStartStatisticsPageState extends State<QuizStartStatisticsPage>{
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
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 0.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 12.0, right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Question 1",
                            style: const TextStyle(color: CustomColors.white, fontSize: 20.0, fontWeight: FontWeight.w400, letterSpacing: 0.5),
                          ),
                          Text(
                            "78%*",
                            style: const TextStyle(color: CustomColors.white, fontSize: 20.0, fontWeight: FontWeight.w500, letterSpacing: 0.5),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 12.0, right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Question 2",
                            style: const TextStyle(color: CustomColors.white, fontSize: 20.0, fontWeight: FontWeight.w400, letterSpacing: 0.5),
                          ),
                          Text(
                            "26%*",
                            style: const TextStyle(color: CustomColors.white, fontSize: 20.0, fontWeight: FontWeight.w500, letterSpacing: 0.5),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 12.0, right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Question 3",
                            style: const TextStyle(color: CustomColors.white, fontSize: 20.0, fontWeight: FontWeight.w400, letterSpacing: 0.5),
                          ),
                          Text(
                            "91%*",
                            style: const TextStyle(color: CustomColors.white, fontSize: 20.0, fontWeight: FontWeight.w500, letterSpacing: 0.5),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 12.0, right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Question 4",
                            style: const TextStyle(color: CustomColors.white, fontSize: 20.0, fontWeight: FontWeight.w400, letterSpacing: 0.5),
                          ),
                          Text(
                            "12%*",
                            style: const TextStyle(color: CustomColors.white, fontSize: 20.0, fontWeight: FontWeight.w500, letterSpacing: 0.5),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 12.0, right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Question 5",
                            style: const TextStyle(color: CustomColors.white, fontSize: 20.0, fontWeight: FontWeight.w400, letterSpacing: 0.5),
                          ),
                          Text(
                            "31%*",
                            style: const TextStyle(color: CustomColors.white, fontSize: 20.0, fontWeight: FontWeight.w500, letterSpacing: 0.5),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0, bottom: 25.0),
                child: Text(
                  "* got the correct answer",
                  style: TextStyle(color: CustomColors.white, fontSize: 14.0, fontWeight: FontWeight.w400, letterSpacing: 0.5),
                ),
              ),

              MediumTitleWidget(text: 'Among your friends', white: true),

              SearchBoxWidget(white: true),

              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 30.0, bottom: 70.0, top: 5.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "@petitstring",
                                style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.5),
                              ),
                              Text(
                                "80%",
                                style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w700, letterSpacing: 0.5),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "@petitstring",
                                style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.5),
                              ),
                              Text(
                                "80%",
                                style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w700, letterSpacing: 0.5),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "@petitstring",
                                style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.5),
                              ),
                              Text(
                                "80%",
                                style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w700, letterSpacing: 0.5),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "@petitstring",
                                style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.5),
                              ),
                              Text(
                                "80%",
                                style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w700, letterSpacing: 0.5),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "@petitstring",
                                style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.5),
                              ),
                              Text(
                                "80%",
                                style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w700, letterSpacing: 0.5),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "@petitstring",
                                style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.5),
                              ),
                              Text(
                                "80%",
                                style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w700, letterSpacing: 0.5),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "@petitstring",
                                style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.5),
                              ),
                              Text(
                                "80%",
                                style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w700, letterSpacing: 0.5),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "@petitstring",
                                style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.5),
                              ),
                              Text(
                                "80%",
                                style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w700, letterSpacing: 0.5),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "@petitstring",
                                style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.5),
                              ),
                              Text(
                                "80%",
                                style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w700, letterSpacing: 0.5),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "@petitstring",
                                style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.5),
                              ),
                              Text(
                                "80%",
                                style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w700, letterSpacing: 0.5),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "@petitstring",
                                style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.5),
                              ),
                              Text(
                                "80%",
                                style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w700, letterSpacing: 0.5),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "@petitstring",
                                style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.5),
                              ),
                              Text(
                                "80%",
                                style: TextStyle(color: CustomColors.white, fontSize: 16.0, fontWeight: FontWeight.w700, letterSpacing: 0.5),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
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
                        AppLocalizations.of(context)!.bestScore + AppLocalizations.of(context)!.punctuationSpace + ': 80%',
                        style: const TextStyle(color: CustomColors.white, fontSize: 14.0, fontWeight: FontWeight.w600, letterSpacing: 0.5),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          '| ' + AppLocalizations.of(context)!.back,
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
