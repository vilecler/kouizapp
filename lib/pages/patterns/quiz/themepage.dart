import 'package:flutter/material.dart';
import 'package:kouizapp/errors/networkexception.dart';
import 'package:kouizapp/utils/hexcolor.dart';
import 'package:kouizapp/utils/translation.dart';
import 'package:kouizapp/widgets/titles/mediumtitlewidget.dart';
import 'package:kouizapp/widgets/searchboxwidget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/apierrors.dart';
import '../../../constants/customcolors.dart';
import '../../../models/theme.dart' as model;
import '../../../services/theme_controller.dart';
import '../../../utils/icon.dart';
import '../../../widgets/hearders/backheaderwidget.dart';
import '../../../widgets/presentation/theme/themepresentationwidget.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({Key? key, required this.onPush}) : super(key: key);

  final Function onPush;

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  String? category;
  String? name;

  int themesCount = 0;

  late Future<List<model.Theme>> _themesFuture;

  void loadThemes(String category) async{
    _themesFuture = fetchThemes(category);
    try {
      List<model.Theme> themes = await _themesFuture;
      setState(() {
        themesCount = themes.length;
      });
    } on NetworkException catch(e){
      setState(() {
        themesCount = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    category = arguments['category'];
    name = arguments['name'];

    loadThemes(category!);

    return SafeArea(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackHeaderWidget(title: name!, bolt: 100),

            const SizedBox(height: 15.0,),
            MediumTitleWidget(text: AppLocalizations.of(context)!.chooseATheme),
            const SearchBoxWidget(),

            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, left: 40.0, right: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(themesCount.toString() + ' ' + AppLocalizations.of(context)!.themes.toLowerCase() + '.', style: const TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 12.0, fontWeight: FontWeight.w400, decoration: TextDecoration.none),),
                  Text(AppLocalizations.of(context)!.filter, style: const TextStyle(color: CustomColors.mainPurple, fontFamily: 'Roboto', fontSize: 12.0, fontWeight: FontWeight.w400, decoration: TextDecoration.none),)
                ],
              ),
            ),

            Flexible(
              child: FutureBuilder<List<model.Theme>>(
                future: _themesFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    NetworkException error = snapshot.error as NetworkException;
                    return Center(
                      child: Text(loadTranslation(APIErrors[error.error.message]!)),
                    );
                  } else if (snapshot.hasData) {
                    return ThemesList(themes: snapshot.data!, onPush: widget.onPush,);
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

class ThemesList extends StatelessWidget {
  const ThemesList({Key? key, required this.themes, required this.onPush}) : super(key: key);

  final List<model.Theme> themes;
  final Function onPush;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: themes.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: (){
              onPush(context, '/quiz/theme/quiz-list', {'theme': themes[index].code, 'name': loadTranslation(themes[index].names)});
            },
            child: ThemePresentationWidget(
              theme: loadTranslation(themes[index].names),
              progression: 0,
              quizCount: themes[index].quizCount,
              color: HexColor(themes[index].color),
              icon: stringToIcon(themes[index].icon),
            )
        );
      },
    );
  }
}