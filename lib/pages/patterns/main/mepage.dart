import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:kouizapp/constants/customcolors.dart';
import 'package:kouizapp/services/auth_cognito.dart' as auth;
import 'package:kouizapp/widgets/dividerwidget.dart';
import 'package:kouizapp/widgets/presentation/friend/suggestion/friendsuggestionwidget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../models/user.dart';
import '../../../others/circletabindicator.dart';
import '../../../widgets/boltwidget.dart';
import '../../../widgets/presentation/friend/friendpresentationwidget.dart';
import '../../../widgets/presentation/quiz/quizhistorypresentationsecondarywidget.dart';
import '../../../widgets/titles/mediumtitlewidget.dart';
import '../../../widgets/presentation/quiz/quizhistorypresentationprimarywidget.dart';
import '../../../widgets/presentation/quiz/quizminepresentationwidget.dart';
import '../../../widgets/buttons/seemore/seemorewidget.dart';
import '../../../widgets/buttons/seemore/smallseemorewidget.dart';

class MePage extends StatefulWidget {
  const MePage({Key? key, required this.onPush}) : super(key: key);

  final Function onPush;

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> with TickerProviderStateMixin{

  late AnimationController _progressController;
  late TabController _tabTabController;

  User? currentUser;

  @override
  void initState() {
    _tabTabController = TabController(vsync: this, length: 3);
    super.initState();

    loadUser();
  }

  @override
  void dispose(){
    _progressController.dispose();
    _tabTabController.dispose();
    super.dispose();
  }

  void loadUser() async{
    User user = await auth.getUser();
    setState(() {
      currentUser = user;
      _progressController = AnimationController(
          vsync: this,
          duration: const Duration(seconds: 3),
          value: currentUser!.getExperiencePercentage()
      )..addListener(() {
        setState(() {
        });
      });
    });
  }

  final TextStyle styleTableNumber = const TextStyle(color: CustomColors.mainPurple, fontSize: 18.0, fontFamily: 'Roboto', fontWeight: FontWeight.w700, decoration: TextDecoration.none);
  final TextStyle styleTableTitle = const TextStyle(color: CustomColors.mainPurple, fontSize: 12.0, fontFamily: 'Roboto', fontWeight: FontWeight.w400, decoration: TextDecoration.none);

  final f = NumberFormat("###,###", "en_US");

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0, left: 20.0, right: 20.0, top: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BoltWidget(number: (currentUser != null) ? currentUser!.energy : 0),
                  GestureDetector(
                    child: const FaIcon(FontAwesomeIcons.cog, color: CustomColors.mainPurple, size: 22.0,),
                    onTap: (){
                      widget.onPush(context, '/me/settings');
                    }
                  )
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: CircleAvatar(
                      backgroundImage: Image.asset('assets/images/profile_picture.png').image,
                      radius: 70,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 0.0),
                    child: Text((currentUser != null) ? currentUser!.username : "", style: const TextStyle(color: CustomColors.mainPurple, fontSize: 22.0, fontWeight: FontWeight.w700, letterSpacing: 0.5, fontFamily: 'Roboto', decoration: TextDecoration.none),),
                  ),
                  Text('@' + ((currentUser != null) ? currentUser!.pseudo : ""), style: const TextStyle(color: CustomColors.mainPurple, fontSize: 16.0, fontWeight: FontWeight.w500, fontFamily: 'Roboto', decoration: TextDecoration.none))
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text('lvl ' + ((currentUser != null) ? currentUser!.getLevel().toString() : ""), style: const TextStyle(color: CustomColors.grey, fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: 'Roboto', decoration: TextDecoration.none),),
                    ),
                    Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: LinearProgressIndicator(
                          value: _progressController.value,
                          minHeight: 10.0,
                          color: CustomColors.mainPurple,
                          backgroundColor: const Color(0xFFDEDDFF),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text('lvl ' + ((currentUser != null) ? (currentUser!.getLevel()  + 1).toString() : "") , style: const TextStyle(color: CustomColors.grey, fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: 'Roboto', decoration: TextDecoration.none)),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 25.0, left: 40.0, right: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text('278', style: styleTableNumber),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(AppLocalizations.of(context)!.quiz, style: styleTableTitle),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(f.format((currentUser != null) ? currentUser!.experience : 0), style: styleTableNumber),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(AppLocalizations.of(context)!.xp, style: styleTableTitle),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text('#2184', style: styleTableNumber),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(AppLocalizations.of(context)!.ranking, style: styleTableTitle),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const DividerWidget(),


            ////////////////////
            // CUSTOM TABBAR
            ////////////////////
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 12.0, bottom: 20.0),
              child: Material(
                child: Column(
                  children: [
                    Container(
                      color: CustomColors.lightWhite,
                      child: TabBar(
                        controller: _tabTabController,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: CircleTabIndicator(color: CustomColors.mainPurple, radius: 4),
                        isScrollable: true,
                        labelColor: CustomColors.mainPurple,
                        labelStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, fontFamily: 'Roboto'),
                        unselectedLabelStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, fontFamily: 'Roboto'),
                        tabs: <Tab>[
                          Tab(text: AppLocalizations.of(context)!.history),
                          Tab(text: AppLocalizations.of(context)!.friends),
                          Tab(text: AppLocalizations.of(context)!.myQuiz),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),


            //////////////////////////////
            // DISPLAY TABBAR CONTENT
            /////////////////////////////
            SizedBox(
              height: (QuizMinePresentaionWidget.height+10) * 11 + 105,    //TODO: calculate dynamically when switching tab
              child: TabBarView(
                controller: _tabTabController,
                children: <Widget>[

                  //History
                  Column(
                    children: [
                      QuizHistoryPresentationPrimaryWidget(name: 'The main flags of the world', date: '24 February 2022', number: 1,),
                      QuizHistoryPresentationSecondaryWidget(name: 'The main flags of the world', date: '24 February 2022', number: 1,),
                      QuizHistoryPresentationPrimaryWidget(name: 'The main flags of the world', date: '24 February 2022', number: 1,),
                      QuizHistoryPresentationPrimaryWidget(name: 'The main flags of the world', date: '24 February 2022', number: 1,),
                      QuizHistoryPresentationSecondaryWidget(name: 'The main flags of the world', date: '24 February 2022', number: 1,),
                      QuizHistoryPresentationPrimaryWidget(name: 'The main flags of the world', date: '24 February 2022', number: 1,),
                      QuizHistoryPresentationPrimaryWidget(name: 'The main flags of the world', date: '24 February 2022', number: 1,),
                      QuizHistoryPresentationPrimaryWidget(name: 'The main flags of the world', date: '24 February 2022', number: 1,),
                      const SeeMoreWidget(),
                    ],
                  ),

                  //Friends
                  Column(
                    children: [
                      MediumTitleWidget(text: AppLocalizations.of(context)!.suggestions),
                      SizedBox(height: 15.0,),
                      SizedBox(
                        height: FriendSuggestionWidget.height + 40,
                        child: ListView(
                          physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: <Widget>[
                            FriendSuggestionWidget(name: 'Vivien', id: '@petitstring'),
                            FriendSuggestionWidget(name: 'Vivien', id: '@petitstring'),
                            FriendSuggestionWidget(name: 'Vivien', id: '@petitstring'),
                            FriendSuggestionWidget(name: 'Vivien', id: '@petitstring'),
                            FriendSuggestionWidget(name: 'Vivien', id: '@petitstring'),
                            FriendSuggestionWidget(name: 'Vivien', id: '@petitstring'),
                            const SmallSeeMoreWidget(),
                            Container(
                              width: 20.0,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      FriendPresentationWidget(name: 'Vivien', id: '@petitstring'),
                      FriendPresentationWidget(name: 'Vivien', id: '@petitstring'),
                      FriendPresentationWidget(name: 'Vivien', id: '@petitstring'),
                      FriendPresentationWidget(name: 'Vivien', id: '@petitstring'),
                      FriendPresentationWidget(name: 'Vivien', id: '@petitstring'),
                      FriendPresentationWidget(name: 'Vivien', id: '@petitstring'),
                      FriendPresentationWidget(name: 'Vivien', id: '@petitstring'),
                      FriendPresentationWidget(name: 'Vivien', id: '@petitstring'),
                      FriendPresentationWidget(name: 'Vivien', id: '@petitstring'),
                      FriendPresentationWidget(name: 'Vivien', id: '@petitstring'),
                      FriendPresentationWidget(name: 'Vivien', id: '@petitstring'),
                      FriendPresentationWidget(name: 'Vivien', id: '@petitstring'),
                      const SeeMoreWidget(),
                    ],
                  ),

                  //My quiz
                  Column(
                    children: [
                      QuizMinePresentaionWidget(name: 'The main flags of the world', peopleCount: 254, questionsCount: 45,),
                      QuizMinePresentaionWidget(name: 'The main flags of the world', peopleCount: 254, questionsCount: 45,),
                      QuizMinePresentaionWidget(name: 'The main flags of the world', peopleCount: 254, questionsCount: 45,),
                      QuizMinePresentaionWidget(name: 'The main flags of the world', peopleCount: 254, questionsCount: 45,),
                      QuizMinePresentaionWidget(name: 'The main flags of the world', peopleCount: 254, questionsCount: 45,),
                      QuizMinePresentaionWidget(name: 'The main flags of the world', peopleCount: 254, questionsCount: 45,),
                      QuizMinePresentaionWidget(name: 'The main flags of the world', peopleCount: 254, questionsCount: 45,),
                      QuizMinePresentaionWidget(name: 'The main flags of the world', peopleCount: 254, questionsCount: 45,),
                      QuizMinePresentaionWidget(name: 'The main flags of the world', peopleCount: 254, questionsCount: 45,),
                      QuizMinePresentaionWidget(name: 'The main flags of the world', peopleCount: 254, questionsCount: 45,),
                      const SeeMoreWidget(),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}