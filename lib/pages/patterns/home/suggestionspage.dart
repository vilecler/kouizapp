import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/widgets/presentation/quiz/quizpresentationprimarywidget.dart';
import 'package:kouizapp/widgets/presentation/quiz/quizpresentationsecondarywidget.dart';
import 'package:kouizapp/widgets/searchboxwidget.dart';

import '../../../constants/customcolors.dart';
import '../../../widgets/boltwidget.dart';

class SuggestionPage extends StatefulWidget {
  const SuggestionPage({Key? key}) : super(key: key);

  @override
  State<SuggestionPage> createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: FaIcon(FontAwesomeIcons.angleLeft, color: CustomColors.mainPurple, size: 30.0,)
                        ),
                      ),
                      Text(
                        'Suggestion',
                        style: const TextStyle(color: CustomColors.mainPurple, fontFamily: 'Roboto', fontWeight: FontWeight.w800, fontSize: 34.0, decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                  BoltWidget(text: '100'),
                ],
              ),
            ),
            const SearchBoxWidget(),

            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, left: 40.0, right: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('85 quiz found.', style: const TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 12.0, fontWeight: FontWeight.w400, decoration: TextDecoration.none),),
                  Text('Filter', style: const TextStyle(color: CustomColors.mainPurple, fontFamily: 'Roboto', fontSize: 12.0, fontWeight: FontWeight.w400, decoration: TextDecoration.none),)
                ],
              ),
            ),

            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    QuizPresentationPrimaryWidget(),
                    QuizPresentaionSecondaryWidget(),
                    QuizPresentationPrimaryWidget(),
                    QuizPresentationPrimaryWidget(),
                    QuizPresentationPrimaryWidget(),
                    QuizPresentaionSecondaryWidget(),
                    QuizPresentationPrimaryWidget(),
                  ],
                ),
              ),
            ),


          ]
      ),
    );
  }
}