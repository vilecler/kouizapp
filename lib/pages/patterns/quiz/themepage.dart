import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/widgets/titles/mediumtitlewidget.dart';
import 'package:kouizapp/widgets/searchboxwidget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/customcolors.dart';
import '../../../widgets/boltwidget.dart';
import '../../../widgets/hearders/backheaderwidget.dart';
import '../../../widgets/presentation/theme/themepresentationwidget.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({Key? key, required this.onPush}) : super(key: key);

  final Function onPush;

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackHeaderWidget(title: 'Geography', bolt: 100),

            const SizedBox(height: 15.0,),
            MediumTitleWidget(text: AppLocalizations.of(context)!.chooseATheme),
            const SearchBoxWidget(),

            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, left: 40.0, right: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('85 ' + AppLocalizations.of(context)!.themes + '.', style: const TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 12.0, fontWeight: FontWeight.w400, decoration: TextDecoration.none),),
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
                          widget.onPush(context, '/quiz/theme/quiz-list');
                        },
                        child: ThemePresentationWidget(
                          theme: "Flags of the World",
                          progression: 100,
                          quizCount: 56,
                          color: CustomColors.mainPurple,
                          icon: FontAwesomeIcons.globeAfrica,
                        )
                    ),
                    ThemePresentationWidget(
                      theme: "Flags of the World",
                      progression: 100,
                      quizCount: 56,
                      color: CustomColors.mainPurple,
                      icon: FontAwesomeIcons.globeAfrica,
                    ),
                    ThemePresentationWidget(
                      theme: "Flags of the World",
                      progression: 100,
                      quizCount: 56,
                      color: CustomColors.mainPurple,
                      icon: FontAwesomeIcons.globeAfrica,
                    ),
                    ThemePresentationWidget(
                      theme: "Flags of the World",
                      progression: 100,
                      quizCount: 56,
                      color: CustomColors.mainPurple,
                      icon: FontAwesomeIcons.globeAfrica,
                    ),
                    ThemePresentationWidget(
                      theme: "Flags of the World",
                      progression: 100,
                      quizCount: 56,
                      color: CustomColors.mainPurple,
                      icon: FontAwesomeIcons.globeAfrica,
                    ),
                    ThemePresentationWidget(
                      theme: "Flags of the World",
                      progression: 100,
                      quizCount: 56,
                      color: CustomColors.mainPurple,
                      icon: FontAwesomeIcons.globeAfrica,
                    ),
                    ThemePresentationWidget(
                      theme: "Flags of the World",
                      progression: 100,
                      quizCount: 56,
                      color: CustomColors.mainPurple,
                      icon: FontAwesomeIcons.globeAfrica,
                    ),
                    ThemePresentationWidget(
                      theme: "Flags of the World",
                      progression: 100,
                      quizCount: 56,
                      color: CustomColors.mainPurple,
                      icon: FontAwesomeIcons.globeAfrica,
                    ),
                    ThemePresentationWidget(
                      theme: "Flags of the World",
                      progression: 100,
                      quizCount: 56,
                      color: CustomColors.mainPurple,
                      icon: FontAwesomeIcons.globeAfrica,
                    ),
                    ThemePresentationWidget(
                      theme: "Flags of the World",
                      progression: 100,
                      quizCount: 56,
                      color: CustomColors.mainPurple,
                      icon: FontAwesomeIcons.globeAfrica,
                    ),
                    ThemePresentationWidget(
                      theme: "Flags of the World",
                      progression: 100,
                      quizCount: 56,
                      color: CustomColors.mainPurple,
                      icon: FontAwesomeIcons.globeAfrica,
                    ),
                    ThemePresentationWidget(
                      theme: "Flags of the World",
                      progression: 100,
                      quizCount: 56,
                      color: CustomColors.mainPurple,
                      icon: FontAwesomeIcons.globeAfrica,
                    ),
                    ThemePresentationWidget(
                      theme: "Flags of the World",
                      progression: 100,
                      quizCount: 56,
                      color: CustomColors.mainPurple,
                      icon: FontAwesomeIcons.globeAfrica,
                    ),
                    ThemePresentationWidget(
                      theme: "Flags of the World",
                      progression: 100,
                      quizCount: 56,
                      color: CustomColors.mainPurple,
                      icon: FontAwesomeIcons.globeAfrica,
                    ),
                    ThemePresentationWidget(
                      theme: "Flags of the World",
                      progression: 100,
                      quizCount: 56,
                      color: CustomColors.mainPurple,
                      icon: FontAwesomeIcons.globeAfrica,
                    ),
                    ThemePresentationWidget(
                      theme: "Flags of the World",
                      progression: 100,
                      quizCount: 56,
                      color: CustomColors.mainPurple,
                      icon: FontAwesomeIcons.globeAfrica,
                    ),
                    ThemePresentationWidget(
                      theme: "Flags of the World",
                      progression: 100,
                      quizCount: 56,
                      color: CustomColors.mainPurple,
                      icon: FontAwesomeIcons.globeAfrica,
                    ),
                    ThemePresentationWidget(
                      theme: "Flags of the World",
                      progression: 100,
                      quizCount: 56,
                      color: CustomColors.mainPurple,
                      icon: FontAwesomeIcons.globeAfrica,
                    ),
                    ThemePresentationWidget(
                      theme: "Flags of the World",
                      progression: 100,
                      quizCount: 56,
                      color: CustomColors.mainPurple,
                      icon: FontAwesomeIcons.globeAfrica,
                    ),
                    ThemePresentationWidget(
                      theme: "Flags of the World",
                      progression: 100,
                      quizCount: 56,
                      color: CustomColors.mainPurple,
                      icon: FontAwesomeIcons.globeAfrica,
                    ),
                    ThemePresentationWidget(
                      theme: "Flags of the World",
                      progression: 100,
                      quizCount: 56,
                      color: CustomColors.mainPurple,
                      icon: FontAwesomeIcons.globeAfrica,
                    ),
                    ThemePresentationWidget(
                      theme: "Flags of the World",
                      progression: 100,
                      quizCount: 56,
                      color: CustomColors.mainPurple,
                      icon: FontAwesomeIcons.globeAfrica,
                    ),
                    ThemePresentationWidget(
                      theme: "Flags of the World",
                      progression: 100,
                      quizCount: 56,
                      color: CustomColors.mainPurple,
                      icon: FontAwesomeIcons.globeAfrica,
                    ),
                    ThemePresentationWidget(
                      theme: "Flags of the World",
                      progression: 100,
                      quizCount: 56,
                      color: CustomColors.mainPurple,
                      icon: FontAwesomeIcons.globeAfrica,
                    ),
                    ThemePresentationWidget(
                      theme: "Flags of the World",
                      progression: 100,
                      quizCount: 56,
                      color: CustomColors.mainPurple,
                      icon: FontAwesomeIcons.globeAfrica,
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