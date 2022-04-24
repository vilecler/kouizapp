import 'package:flutter/material.dart';
import 'package:kouizapp/widgets/presentation/quiz/quizpresentationprimarywidget.dart';
import 'package:kouizapp/widgets/presentation/quiz/quizpresentationsecondarywidget.dart';
import 'package:kouizapp/widgets/searchboxwidget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/customcolors.dart';
import '../../../widgets/hearders/backheaderwidget.dart';

class QuizListPage extends StatefulWidget {
  const QuizListPage({Key? key, required this.onPush}) : super(key: key);

  final Function onPush;

  @override
  State<QuizListPage> createState() => _QuizListPageState();
}

class _QuizListPageState extends State<QuizListPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackHeaderWidget(title: 'Flags of the World', bolt: 100, small: true),
            const SizedBox(height: 15.0,),
            const SearchBoxWidget(),

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
                    GestureDetector(
                      onTap: (){
                        widget.onPush(context, '/quiz/start');
                      },
                      child: QuizPresentationPrimaryWidget(name: 'The main flags of the world', number: 1, reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,)
                    ),
                    QuizPresentationSecondaryWidget(name: 'The main flags of the world', number: 1, reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                    QuizPresentationPrimaryWidget(name: 'The main flags of the world', number: 1, reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                    QuizPresentationPrimaryWidget(name: 'The main flags of the world', number: 1, reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                    QuizPresentationPrimaryWidget(name: 'The main flags of the world', number: 1, reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                    QuizPresentationSecondaryWidget(name: 'The main flags of the world', number: 1, reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                    QuizPresentationPrimaryWidget(name: 'The main flags of the world', number: 1, reward: 20000, questionsCount: 45, bolt: 15, minutes: 5,),
                  ],
                ),
              ),
            ),


          ]
      ),
    );
  }
}