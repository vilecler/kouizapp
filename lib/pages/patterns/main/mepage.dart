import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/constants/customcolors.dart';
import 'package:kouizapp/widgets/dividerwidget.dart';
import 'package:kouizapp/widgets/presentation/friend/suggestion/friendsuggestionwidget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  const MePage({Key? key}) : super(key: key);

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> with TickerProviderStateMixin{

  late AnimationController _progressController;
  late TabController _tabTabController;

  @override
  void initState(){
    _progressController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 3),
        value: 0.7
    )..addListener(() {
      setState(() {
      });
    });
    _tabTabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose(){
    _progressController.dispose();
    _tabTabController.dispose();
    super.dispose();
  }

  final TextStyle styleTableNumber = const TextStyle(color: CustomColors.mainPurple, fontSize: 18.0, fontFamily: 'Roboto', fontWeight: FontWeight.w700, decoration: TextDecoration.none);
  final TextStyle styleTableTitle = const TextStyle(color: CustomColors.mainPurple, fontSize: 12.0, fontFamily: 'Roboto', fontWeight: FontWeight.w400, decoration: TextDecoration.none);


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
                  BoltWidget(text: '100'),
                  const FaIcon(FontAwesomeIcons.cog, color: CustomColors.mainPurple, size: 22.0,)
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
                    child: Text('Vivien', style: const TextStyle(color: CustomColors.mainPurple, fontSize: 22.0, fontWeight: FontWeight.w700, letterSpacing: 0.5, fontFamily: 'Roboto', decoration: TextDecoration.none),),
                  ),
                  Text('@petitstring', style: const TextStyle(color: CustomColors.mainPurple, fontSize: 16.0, fontWeight: FontWeight.w500, fontFamily: 'Roboto', decoration: TextDecoration.none))
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
                      child: Text('lvl 1', style: const TextStyle(color: CustomColors.grey, fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: 'Roboto', decoration: TextDecoration.none),),
                    ),
                    Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: LinearProgressIndicator(
                          value: _progressController.value,
                          minHeight: 10.0,
                          color: CustomColors.mainPurple,
                          backgroundColor: Color(0xFFDEDDFF),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text('lvl 2', style: const TextStyle(color: CustomColors.grey, fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: 'Roboto', decoration: TextDecoration.none)),
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
                      Text('150,000', style: styleTableNumber),
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