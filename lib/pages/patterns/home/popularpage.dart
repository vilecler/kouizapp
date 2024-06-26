import 'package:flutter/material.dart';
import 'package:kouizapp/widgets/hearders/backheaderwidget.dart';
import 'package:kouizapp/widgets/presentation/quiz/quizpresentationprimarywidget.dart';
import 'package:kouizapp/widgets/presentation/quiz/quizpresentationsecondarywidget.dart';
import 'package:kouizapp/widgets/searchboxwidget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/customcolors.dart';

class PopularPage extends StatefulWidget {
  const PopularPage({Key? key}) : super(key: key);

  @override
  State<PopularPage> createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.lightWhite,
      child: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackHeaderWidget(title: AppLocalizations.of(context)!.popular, bolt: 100),
              SearchBoxWidget(),

              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, left: 40.0, right: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('85 quiz found.', style: const TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 12.0, fontWeight: FontWeight.w400, decoration: TextDecoration.none),),
                    Text(AppLocalizations.of(context)!.filter, style: const TextStyle(color: CustomColors.mainPurple, fontFamily: 'Roboto', fontSize: 12.0, fontWeight: FontWeight.w400, decoration: TextDecoration.none),)
                  ],
                ),
              ),

              Flexible(
                child: SingleChildScrollView(
                  child: Column(
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
                    ],
                  ),
                ),
              ),


            ]
        ),
      ),
    );
  }
}