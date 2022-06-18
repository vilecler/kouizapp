import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kouizapp/services/auth_cognito.dart' as auth;
import 'package:kouizapp/utils/translation.dart';
import 'package:kouizapp/widgets/hearders/backheaderwidget.dart';

import 'package:kouizapp/widgets/searchboxwidget.dart';

import '../../../constants/customcolors.dart';
import '../../../models/user.dart';

class QuizLobbyInvitePage extends StatefulWidget {
  const QuizLobbyInvitePage({Key? key, required this.onPush, required this.hideBottomBarCallback, required this.displayBottomBarCallback}) : super(key: key);

  final Function onPush;
  final Function hideBottomBarCallback;
  final Function displayBottomBarCallback;

  @override
  State<QuizLobbyInvitePage> createState() => _QuizLobbyInvitePageState();
}

class _QuizLobbyInvitePageState extends State<QuizLobbyInvitePage> {
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

  void quizPlayground(){
    widget.onPush(context, '/quiz/playground', {});
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
              BackHeaderWidget(title: 'Invite to lobby', bolt: (currentUser != null) ? currentUser!.energy : 0, white: true,),

              const SizedBox(height: 20.0,),
              const SearchBoxWidget(white: true),

              Flexible(
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
                                  'Invite',
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
                      "Invite to lobby",
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
