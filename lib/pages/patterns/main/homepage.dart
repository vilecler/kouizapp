import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/constants/customcolors.dart';
import 'package:kouizapp/widgets/boltwidget.dart';
import 'package:kouizapp/widgets/dividerwidget.dart';
import 'package:kouizapp/widgets/hearders/hearderwidget.dart';
import 'package:kouizapp/widgets/presentation/quiz/quizpresentationsecondarywidget.dart';
import 'package:kouizapp/widgets/buttons/seemore/seemorewidget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../others/circletabindicator.dart';
import '../../../widgets/boxed/boxprimarywidget.dart';
import '../../../widgets/boxed/boxsecondarywidget.dart';
import '../../../widgets/presentation/category/smallcategorypresentationwidget.dart';
import '../../../widgets/presentation/quiz/quizpresentationprimarywidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.onPush}) : super(key: key);

  final Function onPush;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  late TabController _tabTabController;

  @override
  void initState() {
    super.initState();
    _tabTabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabTabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            HeaderWidget(title: AppLocalizations.of(context)!.home, bolt: 100),

            SizedBox(
              height: BoxPrimaryWidget.height + 40,
              child: ListView(
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: <Widget>[
                  BoxPrimaryWidget(title: AppLocalizations.of(context)!.startAdventure, subTitle: AppLocalizations.of(context)!.aSetOfQuizCreatedForYou, text: AppLocalizations.of(context)!.tryToCompleteAllTheseQuizAndEarnExperience),
                  BoxSecondaryWidget(title: AppLocalizations.of(context)!.createYourQuiz, subTitle: AppLocalizations.of(context)!.letsInteractWithPeople, text: AppLocalizations.of(context)!.ifYouArePremiumYouCanCreateYourOwnQuiz),
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
                  SmallCategoryPresentationWidget(color: Colors.green, text: 'Geog.', icon: FontAwesomeIcons.globeEurope,),
                  SmallCategoryPresentationWidget(color: Colors.red, text: 'Sports', icon: FontAwesomeIcons.volleyballBall),
                  SmallCategoryPresentationWidget(color: Colors.orange, text: 'Hist.', icon: FontAwesomeIcons.broadcastTower),
                  SmallCategoryPresentationWidget(color: Colors.blue, text: 'Maths', icon: FontAwesomeIcons.calculator),
                  SmallCategoryPresentationWidget(color: Colors.pink, text: 'General', icon: FontAwesomeIcons.book),
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
                      color: CustomColors.lightWhite,
                      child: TabBar(
                        controller: _tabTabController,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: CircleTabIndicator(color: CustomColors.mainPurple, radius: 4),
                        isScrollable: true,
                        labelColor: CustomColors.mainPurple,
                        labelStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, fontFamily: 'Roboto'),
                        unselectedLabelStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500, fontFamily: 'Roboto'),
                        tabs: [
                          Tab(text: AppLocalizations.of(context)!.suggestion),
                          Tab(text: AppLocalizations.of(context)!.popular),
                          Tab(text: AppLocalizations.of(context)!.recent),
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
              height: (QuizPresentationPrimaryWidget.height+10) * 11 + 75,    //TODO: calculate dynamically when switching tab
              child: TabBarView(
                controller: _tabTabController,
                children: <Widget>[

                  //Suggestion
                  Column(
                    children: [
                      QuizPresentationPrimaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationSecondaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationPrimaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationPrimaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationPrimaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationSecondaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationPrimaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationPrimaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationSecondaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationPrimaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      GestureDetector(
                        onTap: (){
                          widget.onPush(context, '/home/suggestion');
                        },
                        child: const SeeMoreWidget()
                      ),
                      //ADD VIEW ALL
                    ],
                  ),

                  //Popular
                  Column(
                    children: [
                      QuizPresentationPrimaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationSecondaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationPrimaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationPrimaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationPrimaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationSecondaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationPrimaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationPrimaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationSecondaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationPrimaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      GestureDetector(
                          onTap: (){
                            widget.onPush(context, '/home/popular');
                          },
                          child: const SeeMoreWidget()
                      ),
                      //ADD VIEW ALL
                    ],
                  ),

                  //Recent
                  Column(
                    children: [
                      QuizPresentationPrimaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationSecondaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationPrimaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationPrimaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationPrimaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationSecondaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationPrimaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationPrimaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationSecondaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      QuizPresentationPrimaryWidget(name: 'The main flags of the world', themePosition: 'N°1', reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                      GestureDetector(
                          onTap: (){
                            widget.onPush(context, '/home/recent');
                          },
                          child: const SeeMoreWidget()
                      ),
                      //ADD VIEW ALL
                    ],
                  ),
                ],
              ),
            ),


          ]
        ),
      ),
    );
  }
}
