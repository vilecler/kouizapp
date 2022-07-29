import 'package:flutter/material.dart';
import 'package:kouizapp/errors/networkexception.dart';
import 'package:kouizapp/services/auth_cognito.dart' as auth;
import 'package:kouizapp/utils/hexcolor.dart';
import 'package:kouizapp/utils/translation.dart';
import 'package:kouizapp/widgets/titles/mediumtitlewidget.dart';
import 'package:kouizapp/widgets/searchboxwidget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/apierrors.dart';
import '../../../constants/customcolors.dart';
import '../../../models/theme.dart' as model;
import '../../../models/user.dart';
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
  String? categoryCode;
  String? categoryName;
  User? currentUser;

  int themesCount = 0;

  late Future<List<model.Theme>> _themesFuture;
  bool _themeFetchStarted = false;

  void loadThemes(String category) async{
    if(_themeFetchStarted){
      return;
    }
    _themeFetchStarted = true;
    _themesFuture = fetchThemes(category);
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
    categoryCode = arguments['categoryCode'];
    categoryName = arguments['categoryName'];
    loadThemes(categoryCode!);
    loadUser();

    return SafeArea(
      child: Container(
        color: CustomColors.lightWhite,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackHeaderWidget(title: categoryName!, bolt: (currentUser != null) ? currentUser!.energy : 0),

              const SizedBox(height: 15.0,),
              MediumTitleWidget(text: AppLocalizations.of(context)!.chooseATheme),
              SearchBoxWidget(onTextChanged: searchBoxTextChanged),

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
                      List<model.Theme> themes = snapshot.data!;
                      List<model.Theme> restrictedThemes = (searchText != "") ? themes.where((element) => loadTranslation(element.name).toLowerCase().contains(searchText.toLowerCase())).toList() : themes;
                      restrictedThemes.sort( (a, b) => loadTranslation(a.name).compareTo(loadTranslation(b.name)) );
                      themesCount = restrictedThemes.length;
                      if(themesCount == 0){
                        return Center(
                          child: Text(loadTranslation(APIErrors['No theme found.']!)),
                        );
                      }
                      return ThemesList(themes: restrictedThemes, onPush: widget.onPush, categoryName: categoryName!,);
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

class ThemesList extends StatelessWidget {
  const ThemesList({Key? key, required this.themes, required this.onPush, required this.categoryName}) : super(key: key);

  final List<model.Theme> themes;
  final Function onPush;
  final String categoryName;

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: themes.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: (){
              onPush(context, '/quiz/theme/quiz-list', {'themeCode': themes[index].code, 'themeName': loadTranslation(themes[index].name), 'categoryName': categoryName});
            },
            child: ThemePresentationWidget(
              theme: loadTranslation(themes[index].name),
              progression: 0,
              quizCount: themes[index].quizzesCount,
              color: HexColor(themes[index].color),
              icon: stringToIcon(themes[index].icon),
            )
        );
      },
    );
  }
}