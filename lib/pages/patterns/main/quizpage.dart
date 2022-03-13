import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/widgets/boxprimarywidget.dart';
import 'package:kouizapp/widgets/dividerwidget.dart';
import 'package:kouizapp/widgets/friendplaysuggestionwidget.dart';
import 'package:kouizapp/widgets/mediumtitlewidget.dart';
import 'package:kouizapp/widgets/searchboxwidget.dart';

import '../../../constants/customcolors.dart';
import '../../../others/circletabindicator.dart';
import '../../../widgets/bigtitlewidget.dart';
import '../../../widgets/boltwidget.dart';
import '../../../widgets/boxtitleprimarywidget.dart';
import '../../../widgets/boxtitlesecondarywidget.dart';
import '../../../widgets/categorypresentationwidget.dart';
import '../../../widgets/quizcommunitypresentationwidget.dart';
import '../../../widgets/quizpresentationprimarywidget.dart';
import '../../../widgets/quizpresentationsecondarywidget.dart';
import '../../../widgets/seemorewidget.dart';
import '../../../widgets/smallseemorewidget.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> with SingleTickerProviderStateMixin {

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
    Tab(text: 'Official', ),
    Tab(text: 'Community'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0, left: 20.0, right: 20.0, top: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TabBar(
                controller: _tabTabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: CircleTabIndicator(color: CustomColors.mainPurple, radius: 4),
                isScrollable: true,
                labelColor: CustomColors.mainPurple,
                labelStyle: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700, fontFamily: 'Roboto'),
                unselectedLabelStyle: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500, fontFamily: 'Roboto'),
                tabs: myTabs,
                labelPadding: EdgeInsets.only(right: 15.0)
              ),
              BoltWidget(text: '100'),
            ],
          ),
        ),


        //////////////////////////////
        // DISPLAY TABBAR CONTENT
        /////////////////////////////
        SizedBox(
          height: (CategoryPresentationWidget.height+20) * 30 + 75,    //TODO: calculate dynamically when switching tab
          child: TabBarView(
            controller: _tabTabController,
            children: <Widget>[

              //Official
              Column(
                children: [

                  BigTitleWidget(text: 'Choose a category'),
                  SearchBoxWidget(),

                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                    child: BoxTitleSecondaryWidget(title: 'Select all categories'),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, left: 40.0, right: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('85 categories.', style: TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 12.0, fontWeight: FontWeight.w400),),
                        Text('Sort by...', style: TextStyle(color: CustomColors.mainPurple, fontFamily: 'Roboto', fontSize: 12.0, fontWeight: FontWeight.w400),)
                      ],
                    ),
                  ),

                  CategoryPresentationWidget(),
                  CategoryPresentationWidget(),
                  CategoryPresentationWidget(),
                  CategoryPresentationWidget(),
                  CategoryPresentationWidget(),
                  CategoryPresentationWidget(),
                  CategoryPresentationWidget(),
                  CategoryPresentationWidget(),
                  CategoryPresentationWidget(),
                  CategoryPresentationWidget(),
                  CategoryPresentationWidget(),
                  CategoryPresentationWidget(),
                  CategoryPresentationWidget(),
                  CategoryPresentationWidget(),
                  CategoryPresentationWidget(),
                  CategoryPresentationWidget(),
                  CategoryPresentationWidget(),
                  CategoryPresentationWidget(),
                  CategoryPresentationWidget(),
                  CategoryPresentationWidget(),
                  CategoryPresentationWidget(),
                  CategoryPresentationWidget(),
                  CategoryPresentationWidget(),
                  CategoryPresentationWidget(),
                  CategoryPresentationWidget(),
                  CategoryPresentationWidget(),
                  CategoryPresentationWidget(),

                ],
              ),

              //Community
              Column(
                children: [
                  MediumTitleWidget(text: 'Play with friends'),

                  SizedBox(
                    height: FriendPlaySuggestionWidget.height + 40,
                    child: ListView(
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: <Widget>[
                        FriendPlaySuggestionWidget(),
                        FriendPlaySuggestionWidget(),
                        FriendPlaySuggestionWidget(),
                        FriendPlaySuggestionWidget(),
                        FriendPlaySuggestionWidget(),
                        FriendPlaySuggestionWidget(),
                        SmallSeeMoreWidget(),
                        Container(
                          width: 20.0,
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 35.0, bottom: 30.0),
                    child: BoxTitlePrimaryWidget(title: 'Create a quiz'),
                  ),

                  DividerWidget(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: SearchBoxWidget(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text(
                          'Filter...',
                          style: TextStyle(color: CustomColors.mainPurple, fontSize: 16.0, fontFamily: 'Roboto', fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),

                  QuizCommunityPresentationWidget(),
                  QuizCommunityPresentationWidget(),
                  QuizCommunityPresentationWidget(),
                  QuizCommunityPresentationWidget(),
                  QuizCommunityPresentationWidget(),
                  QuizCommunityPresentationWidget(),
                  QuizCommunityPresentationWidget(),
                  QuizCommunityPresentationWidget(),
                  QuizCommunityPresentationWidget(),
                  QuizCommunityPresentationWidget(),
                  QuizCommunityPresentationWidget(),
                  QuizCommunityPresentationWidget(),
                  QuizCommunityPresentationWidget(),
                  QuizCommunityPresentationWidget(),
                  QuizCommunityPresentationWidget(),
                  QuizCommunityPresentationWidget(),
                  QuizCommunityPresentationWidget(),
                ],
              ),

            ],
          ),
        ),

      ]
    );
  }
}