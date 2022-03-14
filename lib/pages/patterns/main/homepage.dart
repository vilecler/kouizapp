import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/constants/customcolors.dart';
import 'package:kouizapp/widgets/boltwidget.dart';
import 'package:kouizapp/widgets/dividerwidget.dart';
import 'package:kouizapp/widgets/quizpresentationprimarywidget.dart';
import 'package:kouizapp/widgets/quizpresentationsecondarywidget.dart';
import 'package:kouizapp/widgets/seemorewidget.dart';

import '../../../others/circletabindicator.dart';
import '../../../widgets/boxprimarywidget.dart';
import '../../../widgets/boxsecondarywidget.dart';
import '../../../widgets/smallthemewidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  late TabController _tabTabController;

  @override
  void initState() {
    super.initState();
    _tabTabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabTabController.dispose();
    super.dispose();
  }


  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Suggestion'),
    Tab(text: 'Popular'),
    Tab(text: 'Recent'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0, left: 20.0, right: 20.0, top: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Home',
                style: const TextStyle(color: CustomColors.mainPurple, fontFamily: 'Roboto', fontWeight: FontWeight.w800, fontSize: 34.0, decoration: TextDecoration.none),
              ),
              BoltWidget(text: '100'),
            ],
          ),
        ),

        SizedBox(
          height: BoxPrimaryWidget.height + 40,
          child: ListView(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: <Widget>[
              BoxPrimaryWidget(title: "Start Adventure", subTitle: "A set of quiz created for you", text: "Try to complete all these quiz and earn experience."),
              BoxSecondaryWidget(title: "Create your quiz", subTitle: "Let's interact with people", text: "If you are premium, you are able to create your own quiz."),
              Container(
                width: 20.0,
              )
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 25, left: 25, right: 25, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SmallThemeWidget(color: Colors.green, text: 'Geog.', icon: FontAwesomeIcons.globeEurope,),
              SmallThemeWidget(color: Colors.red, text: 'Sports', icon: FontAwesomeIcons.volleyballBall),
              SmallThemeWidget(color: Colors.orange, text: 'Hist.', icon: FontAwesomeIcons.broadcastTower),
              SmallThemeWidget(color: Colors.blue, text: 'Maths', icon: FontAwesomeIcons.calculator),
              SmallThemeWidget(color: Colors.pink, text: 'General', icon: FontAwesomeIcons.book),
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
          height: (QuizPresentaionPrimaryWidget.height+10) * 11 + 75,    //TODO: calculate dynamically when switching tab
          child: TabBarView(
            controller: _tabTabController,
            children: <Widget>[

              //Suggestion
              Column(
                children: [
                  QuizPresentaionPrimaryWidget(),
                  QuizPresentaionSecondaryWidget(),
                  QuizPresentaionPrimaryWidget(),
                  QuizPresentaionPrimaryWidget(),
                  QuizPresentaionPrimaryWidget(),
                  QuizPresentaionSecondaryWidget(),
                  QuizPresentaionPrimaryWidget(),
                  QuizPresentaionPrimaryWidget(),
                  QuizPresentaionSecondaryWidget(),
                  QuizPresentaionPrimaryWidget(),
                  const SeeMoreWidget()
                  //ADD VIEW ALL
                ],
              ),

              //Recent
              Column(
                children: [
                  QuizPresentaionPrimaryWidget(),
                  QuizPresentaionSecondaryWidget(),
                  QuizPresentaionPrimaryWidget(),
                  QuizPresentaionPrimaryWidget(),
                  QuizPresentaionPrimaryWidget(),
                  QuizPresentaionSecondaryWidget(),
                  QuizPresentaionPrimaryWidget(),
                  QuizPresentaionPrimaryWidget(),
                  QuizPresentaionSecondaryWidget(),
                  QuizPresentaionPrimaryWidget(),
                  const SeeMoreWidget()
                  //ADD VIEW ALL
                ],
              ),

              //Most Popular
              Column(
                children: [
                  QuizPresentaionPrimaryWidget(),
                  QuizPresentaionSecondaryWidget(),
                  QuizPresentaionPrimaryWidget(),
                  QuizPresentaionPrimaryWidget(),
                  QuizPresentaionPrimaryWidget(),
                  QuizPresentaionSecondaryWidget(),
                  QuizPresentaionPrimaryWidget(),
                  QuizPresentaionPrimaryWidget(),
                  QuizPresentaionSecondaryWidget(),
                  QuizPresentaionPrimaryWidget(),
                  const SeeMoreWidget()
                  //ADD VIEW ALL
                ],
              ),
            ],
          ),
        ),


      ]
    );
  }
}