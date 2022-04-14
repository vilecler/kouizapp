import 'package:flutter/material.dart';
import 'package:kouizapp/widgets/dividerwidget.dart';
import 'package:kouizapp/widgets/presentation/friend/suggestion/friendplaysuggestionwidget.dart';
import 'package:kouizapp/widgets/titles/mediumtitlewidget.dart';
import 'package:kouizapp/widgets/searchboxwidget.dart';

import '../../../constants/customcolors.dart';
import '../../../others/circletabindicator.dart';
import '../../../widgets/boltwidget.dart';
import '../../../widgets/boxed/boxtitleprimarywidget.dart';
import '../../../widgets/presentation/category/categorypresentationwidget.dart';
import '../../../widgets/presentation/quiz/quizcommunitypresentationwidget.dart';
import '../../../widgets/buttons/seemore/smallseemorewidget.dart';

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
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0, top: 0.0),
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
                    labelPadding: const EdgeInsets.only(right: 15.0)
                  ),
                  BoltWidget(text: '100'),
                ],
              ),
            ),
          ),


          //////////////////////////////
          // DISPLAY TABBAR CONTENT
          /////////////////////////////
          Material(
            child: SizedBox(
              height: (CategoryPresentationWidget.height+20) * 30 + 75,    //TODO: calculate dynamically when switching tab
              child: TabBarView(
                controller: _tabTabController,
                children: <Widget>[

                  //Official
                  Column(
                    children: [

                      MediumTitleWidget(text: 'Choose a category'),
                      const SearchBoxWidget(),

                      Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 15.0, left: 40.0, right: 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('85 categories.', style: const TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 12.0, fontWeight: FontWeight.w400, decoration: TextDecoration.none),),
                            Text('Sort by...', style: const TextStyle(color: CustomColors.mainPurple, fontFamily: 'Roboto', fontSize: 12.0, fontWeight: FontWeight.w400, decoration: TextDecoration.none),)
                          ],
                        ),
                      ),

                      Flexible(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
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
                            ]
                          )
                        )
                      )



                    ],
                  ),

                  //Community
                  Column(
                    children: [
                      MediumTitleWidget(text: 'Play with friends'),
                      const SizedBox(height: 15.0,),
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
                            const SmallSeeMoreWidget(),
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

                      const DividerWidget(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(
                            child: SearchBoxWidget(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Text(
                              'Filter',
                              style: const TextStyle(color: CustomColors.alternativePurple, fontSize: 16.0, fontFamily: 'Roboto', fontWeight: FontWeight.w600, decoration: TextDecoration.none),
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
          ),

        ]
      ),
    );
  }
}