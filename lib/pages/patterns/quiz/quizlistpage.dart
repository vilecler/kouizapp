import 'package:flutter/material.dart';
import 'package:kouizapp/utils/translation.dart';
import 'package:kouizapp/widgets/presentation/quiz/quizpresentationprimarywidget.dart';
import 'package:kouizapp/widgets/presentation/quiz/quizpresentationsecondarywidget.dart';
import 'package:kouizapp/widgets/searchboxwidget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/customcolors.dart';
import '../../../models/quiz.dart';
import '../../../services/quiz_controller.dart';
import '../../../widgets/hearders/backheaderwidget.dart';

class QuizListPage extends StatefulWidget {
  const QuizListPage({Key? key, required this.onPush}) : super(key: key);

  final Function onPush;

  @override
  State<QuizListPage> createState() => _QuizListPageState();
}

class _QuizListPageState extends State<QuizListPage> {
  String? theme;
  String? name;

  int quizCount = 0;

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    theme = arguments['theme'];
    name = arguments['name'];

    return SafeArea(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackHeaderWidget(title: name!, bolt: 100, small: true),
            const SizedBox(height: 15.0,),
            const SearchBoxWidget(),

            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, left: 40.0, right: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(quizCount.toString() + ' quiz found.', style: const TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 12.0, fontWeight: FontWeight.w400, decoration: TextDecoration.none),),
                  Text(AppLocalizations.of(context)!.filter, style: const TextStyle(color: CustomColors.mainPurple, fontFamily: 'Roboto', fontSize: 12.0, fontWeight: FontWeight.w400, decoration: TextDecoration.none),)
                ],
              ),
            ),

            Flexible(
              child: FutureBuilder<List<Quiz>>(
                future: fetchQuizzes(theme!),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('An error has occurred!'),
                    );
                  } else if (snapshot.hasData) {
                    quizCount = snapshot.data!.length;
                    print("Length: " + quizCount.toString());
                    return QuizzesList(quizzes: snapshot.data!, onPush: widget.onPush,);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),

          ]
      ),
    );
  }
}

class QuizzesList extends StatelessWidget {
  const QuizzesList({Key? key, required this.quizzes, required this.onPush}) : super(key: key);

  final List<Quiz> quizzes;
  final Function onPush;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: quizzes.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: (){
              onPush(context, '/quiz/start', {'code': '', 'name': loadTranslation(quizzes[index].name)});
            },
            child: ( quizzes[index].isPremium
              ? QuizPresentationSecondaryWidget(name: loadTranslation(quizzes[index].name), themePosition: quizzes[index].themePosition!, reward: quizzes[index].experienceWinnable, questionsCount: quizzes[index].questionsCount, bolt: quizzes[index].energyRequired, minutes: getQuizDurationInMinutes(quizzes[index].durationBetweenQuestions, quizzes[index].questionsCount),)
              : QuizPresentationPrimaryWidget(name: loadTranslation(quizzes[index].name), themePosition: quizzes[index].themePosition!, reward: quizzes[index].experienceWinnable, questionsCount: quizzes[index].questionsCount, bolt: quizzes[index].energyRequired, minutes: getQuizDurationInMinutes(quizzes[index].durationBetweenQuestions, quizzes[index].questionsCount),)
            )
        );
      },
    );
  }

  int getQuizDurationInMinutes(int durationBetweenQuestions, int questionsCount){
    int totalSeconds = durationBetweenQuestions * questionsCount;
    double timeInMinute = totalSeconds / 60;
    return timeInMinute.round();
  }
}