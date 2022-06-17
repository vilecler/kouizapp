import 'package:flutter/material.dart';
import 'package:kouizapp/services/auth_cognito.dart' as auth;
import 'package:kouizapp/utils/translation.dart';
import 'package:kouizapp/widgets/presentation/quiz/quizpresentationprimarywidget.dart';
import 'package:kouizapp/widgets/presentation/quiz/quizpresentationsecondarywidget.dart';
import 'package:kouizapp/widgets/searchboxwidget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/apierrors.dart';
import '../../../constants/customcolors.dart';
import '../../../errors/networkexception.dart';
import '../../../models/quiz.dart';
import '../../../models/user.dart';
import '../../../services/quiz_controller.dart';
import '../../../widgets/hearders/backheaderwidget.dart';

class QuizListPage extends StatefulWidget {
  const QuizListPage({Key? key, required this.onPush}) : super(key: key);

  final Function onPush;

  @override
  State<QuizListPage> createState() => _QuizListPageState();
}

class _QuizListPageState extends State<QuizListPage> {
  String? themeCode;
  String? themeName;
  String? categoryName;
  User? currentUser;

  int quizCount = 0;

  late Future<List<Quiz>> _quizzesFuture;
  bool _quizFetchStarted = false;

  void loadQuizzes(String theme) async{
    if(_quizFetchStarted){
      return;
    }
    _quizFetchStarted = true;
    _quizzesFuture = fetchQuizzes(theme);
  }

  void loadUser() async{
    User user = await auth.getUser();
    setState(() {
      currentUser = user;
    });
  }

  String searchText = "";
  void searchBoxTextChanged(String newText){
    setState(() {
      searchText = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    themeCode = arguments['themeCode'];
    themeName = arguments['themeName'];
    categoryName = arguments['categoryName'];
    loadQuizzes(themeCode!);
    loadUser();

    return SafeArea(
      child: Container(
        color: CustomColors.lightWhite,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackHeaderWidget(title: themeName!, bolt: (currentUser != null) ? currentUser!.energy : 0, small: true),
              const SizedBox(height: 15.0,),
              SearchBoxWidget(onTextChanged: searchBoxTextChanged),

              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, left: 40.0, right: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(quizCount.toString() + ' ' + AppLocalizations.of(context)!.quizzes.toLowerCase() + '.', style: const TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 12.0, fontWeight: FontWeight.w400, decoration: TextDecoration.none),),
                    Text(AppLocalizations.of(context)!.filter, style: const TextStyle(color: CustomColors.mainPurple, fontFamily: 'Roboto', fontSize: 12.0, fontWeight: FontWeight.w400, decoration: TextDecoration.none),)
                  ],
                ),
              ),

              Flexible(
                child: FutureBuilder<List<Quiz>>(
                  future: _quizzesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      NetworkException error = snapshot.error as NetworkException;
                      return Center(
                        child: Text(loadTranslation(APIErrors[error.error.message]!)),
                      );
                    } else if (snapshot.hasData) {
                      List<Quiz> quizzes = snapshot.data!;
                      List<Quiz> restrictedQuizzes = (searchText != "") ? quizzes.where((element) => loadTranslation(element.name).toLowerCase().contains(searchText.toLowerCase())).toList() : quizzes;
                      restrictedQuizzes.sort( (a, b) => loadTranslation(a.name).compareTo(loadTranslation(b.name)) );
                      quizCount = restrictedQuizzes.length;
                      if(quizCount == 0){
                        return Center(
                          child: Text(loadTranslation(APIErrors['No quiz found.']!)),
                        );
                      }
                      return QuizzesList(quizzes: restrictedQuizzes, onPush: widget.onPush, themeName: themeName!, categoryName: categoryName!,);
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
      ),
    );
  }
}

class QuizzesList extends StatelessWidget {
  const QuizzesList({Key? key, required this.quizzes, required this.onPush, required this.themeName, required this.categoryName}) : super(key: key);

  final List<Quiz> quizzes;
  final Function onPush;
  final String themeName;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: quizzes.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: (){
              onPush(context, '/quiz/start', {'quiz': quizzes[index], 'themeName': themeName, 'categoryName': categoryName});
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