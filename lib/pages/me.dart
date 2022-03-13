import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/constants/customcolors.dart';
import 'package:kouizapp/widgets/dividerwidget.dart';
import 'package:kouizapp/widgets/friendsuggestionwidget.dart';

import '../others/circletabindicator.dart';
import '../widgets/boltwidget.dart';
import '../widgets/friendpresentationwidget.dart';
import '../widgets/mediumtitlewidget.dart';
import '../widgets/quizhistorypresentationprimarywidget.dart';
import '../widgets/quizhistorypresentationsecondarywidget.dart';
import '../widgets/quizminepresentationwidget.dart';
import '../widgets/quizpresentationprimarywidget.dart';
import '../widgets/quizpresentationsecondarywidget.dart';
import '../widgets/seemorewidget.dart';
import '../widgets/smallseemorewidget.dart';

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
    _tabTabController = TabController(vsync: this, length: myTabs.length);
    super.initState();
  }

  @override
  void dispose(){
    _progressController.dispose();
    _tabTabController.dispose();
    super.dispose();
  }

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'History'),
    Tab(text: 'Friends'),
    Tab(text: 'My quiz'),
  ];

  final TextStyle styleTableNumber = TextStyle(color: CustomColors.mainPurple, fontSize: 18.0, fontFamily: 'Roboto', fontWeight: FontWeight.w700);
  final TextStyle styleTableTitle = TextStyle(color: CustomColors.mainPurple, fontSize: 12.0, fontFamily: 'Roboto', fontWeight: FontWeight.w400);


  @override
  Widget build(BuildContext context) {
    return Column(
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
                padding: const EdgeInsets.only(top: 20.0),
                child: CircleAvatar(
                  backgroundImage: Image.asset('assets/images/profile_picture.png').image,
                  radius: 70,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 0.0),
                child: Text('Vivien', style: const TextStyle(color: CustomColors.mainPurple, fontSize: 22.0, fontWeight: FontWeight.w700, letterSpacing: 0.5, fontFamily: 'Roboto'),),
              ),
              Text('@petitstring', style: const TextStyle(color: CustomColors.mainPurple, fontSize: 16.0, fontWeight: FontWeight.w500, fontFamily: 'Roboto'))
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('lvl 1', style: TextStyle(color: CustomColors.grey, fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),),
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
                  child: Text('lvl 2', style: TextStyle(color: CustomColors.grey, fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: 'Roboto')),
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 40.0, left: 40.0, right: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('278', style: styleTableNumber),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text('Quiz', style: styleTableTitle),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text('150,000', style: styleTableNumber),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text('xp', style: styleTableTitle),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text('#2184', style: styleTableNumber),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text('Ranking', style: styleTableTitle),
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
          padding: const EdgeInsets.only(left: 10.0, top: 12.0, bottom: 25.0),
          child: Material(
            child: Column(
              children: [
                Container(
                  color: CustomColors.white,
                  child: TabBar(
                    controller: _tabTabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: CircleTabIndicator(color: CustomColors.mainPurple, radius: 4),
                    isScrollable: true,
                    labelColor: CustomColors.mainPurple,
                    labelStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, fontFamily: 'Roboto'),
                    unselectedLabelStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, fontFamily: 'Roboto'),
                    tabs: myTabs,
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
                  QuizHistoryPresentationPrimaryWidget(),
                  QuizHistoryPresentationSecondaryWidget(),
                  QuizHistoryPresentationPrimaryWidget(),
                  QuizHistoryPresentationPrimaryWidget(),
                  QuizHistoryPresentationSecondaryWidget(),
                  QuizHistoryPresentationPrimaryWidget(),
                  QuizHistoryPresentationPrimaryWidget(),
                  QuizHistoryPresentationSecondaryWidget(),
                  QuizHistoryPresentationPrimaryWidget(),
                  QuizHistoryPresentationPrimaryWidget(),
                  QuizHistoryPresentationPrimaryWidget(),
                  SeeMoreWidget(),
                  //ADD VIEW ALL
                ],
              ),

              //Friends
              Column(
                children: [
                  const MediumTitleWidget(text: 'Suggestions'),
                  SizedBox(
                    height: FriendSuggestionWidget.height + 40,
                    child: ListView(
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: <Widget>[
                        FriendSuggestionWidget(),
                        FriendSuggestionWidget(),
                        FriendSuggestionWidget(),
                        FriendSuggestionWidget(),
                        FriendSuggestionWidget(),
                        FriendSuggestionWidget(),
                        SmallSeeMoreWidget(),
                        Container(
                          width: 20.0,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  FriendPresentationWidget(),
                  FriendPresentationWidget(),
                  FriendPresentationWidget(),
                  FriendPresentationWidget(),
                  FriendPresentationWidget(),
                  FriendPresentationWidget(),
                  FriendPresentationWidget(),
                  FriendPresentationWidget(),
                  FriendPresentationWidget(),
                  FriendPresentationWidget(),
                  FriendPresentationWidget(),
                  FriendPresentationWidget(),
                  FriendPresentationWidget(),
                  SeeMoreWidget(),
                  //ADD VIEW ALL
                ],
              ),

              //My quiz
              Column(
                children: [
                  QuizMinePresentaionWidget(),
                  QuizMinePresentaionWidget(),
                  QuizMinePresentaionWidget(),
                  QuizMinePresentaionWidget(),
                  QuizMinePresentaionWidget(),
                  QuizMinePresentaionWidget(),
                  QuizMinePresentaionWidget(),
                  QuizMinePresentaionWidget(),
                  QuizMinePresentaionWidget(),
                  QuizMinePresentaionWidget(),
                  SeeMoreWidget(),
                  //ADD VIEW ALL
                ],
              ),
            ],
          ),
        ),


      ],
    );
  }
}