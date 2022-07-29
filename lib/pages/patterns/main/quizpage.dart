import 'package:flutter/material.dart';
import 'package:kouizapp/services/auth_cognito.dart' as auth;
import 'package:kouizapp/utils/hexcolor.dart';
import 'package:kouizapp/utils/translation.dart';
import 'package:kouizapp/widgets/presentation/friend/suggestion/friendplaysuggestionwidget.dart';
import 'package:kouizapp/widgets/titles/mediumtitlewidget.dart';
import 'package:kouizapp/widgets/searchboxwidget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/apierrors.dart';
import '../../../constants/customcolors.dart';
import '../../../models/category.dart';
import '../../../models/user.dart';
import '../../../others/circletabindicator.dart';
import '../../../services/category_controller.dart';
import '../../../utils/icon.dart';
import '../../../widgets/boltwidget.dart';
import '../../../widgets/presentation/category/categorypresentationwidget.dart';
import '../../../widgets/presentation/quiz/quizcommunitypresentationwidget.dart';
import '../../../widgets/buttons/seemore/smallseemorewidget.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key, required this.onPush}) : super(key: key);

  final Function onPush;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> with SingleTickerProviderStateMixin {
  int categoriesCount = 0;

  late Future<List<Category>> _categoriesFuture;
  bool _loadCategoriesStarted = false;

  void loadCategories() async{
    if(_loadCategoriesStarted){
      return;
    }
    _loadCategoriesStarted = true;
    _categoriesFuture = fetchCategories();
  }

  late TabController _tabTabController;
  User? currentUser;

  @override
  void initState() {
    _tabTabController = TabController(vsync: this, length: 2);
    loadCategories();
    super.initState();
  }

  @override
  void dispose() {
    _tabTabController.dispose();
    super.dispose();
  }


  void loadUser() async{
    User user = await auth.getUser();
    setState(() {
      currentUser = user;
    });
  }

  String officialSearchText = "";
  void officialSearchBoxTextChanged(String newText){
    setState(() {
      officialSearchText = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    loadUser();
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0, left: 20.0, right: 20.0, top: 0.0),
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
                    tabs: <Tab>[
                      Tab(text: AppLocalizations.of(context)!.official),
                      Tab(text: AppLocalizations.of(context)!.community),
                    ],
                    labelPadding: const EdgeInsets.only(right: 15.0)
                  ),
                  BoltWidget(number: (currentUser != null) ? currentUser!.energy : 0),
                ],
              ),
            ),
          ),


          //////////////////////////////
          // DISPLAY TABBAR CONTENT
          /////////////////////////////
          Flexible(
            //height: (CategoryPresentationWidget.height+20) * 30 + 75,    //TODO: calculate dynamically when switching tab
            child: TabBarView(
              controller: _tabTabController,
              children: <Widget>[

                //Official
                Column(
                  children: [
                    MediumTitleWidget(text: AppLocalizations.of(context)!.chooseACategory),
                    SearchBoxWidget(onTextChanged: officialSearchBoxTextChanged,),

                    Padding(
                      padding: const EdgeInsets.only(top: 0, bottom: 15.0, left: 40.0, right: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(categoriesCount.toString() + ' ' + AppLocalizations.of(context)!.categories.toLowerCase() + '.', style: const TextStyle(color: CustomColors.grey, fontFamily: 'Roboto', fontSize: 12.0, fontWeight: FontWeight.w400, decoration: TextDecoration.none),),
                          Text(AppLocalizations.of(context)!.sortBy, style: const TextStyle(color: CustomColors.mainPurple, fontFamily: 'Roboto', fontSize: 12.0, fontWeight: FontWeight.w400, decoration: TextDecoration.none),)
                        ],
                      ),
                    ),

                    Flexible(
                      child: FutureBuilder<List<Category>>(
                        future: _categoriesFuture,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const Center(
                              child: Text('An error has occurred!'),
                            );
                          } else if (snapshot.hasData) {
                            List<Category> categories = snapshot.data!;
                            List<Category> restrictedCategories = (officialSearchText != "") ? categories.where((element) => loadTranslation(element.name).toLowerCase().contains(officialSearchText.toLowerCase())).toList() : categories;
                            restrictedCategories.sort( (a, b) => loadTranslation(a.name).compareTo(loadTranslation(b.name)) );
                            categoriesCount = restrictedCategories.length;
                            if(categoriesCount == 0){
                              return Center(
                                child: Text(loadTranslation(APIErrors['No category found.']!)),
                              );
                            }
                            return CategoriesList(categories: restrictedCategories, onPush: widget.onPush,);
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),

                  ],
                ),

                //Community
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: SearchBoxWidget(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Text(
                            AppLocalizations.of(context)!.filter,
                            style: const TextStyle(color: CustomColors.alternativePurple, fontSize: 16.0, fontFamily: 'Roboto', fontWeight: FontWeight.w600, decoration: TextDecoration.none),
                          ),
                        ),
                      ],
                    ),

                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                        children: [
                          QuizCommunityPresentationWidget(name: 'The main flags of the world', creatorId: '@petitstring', questionsCount: 45, bolt: 15, minutes: 5,),
                          QuizCommunityPresentationWidget(name: 'The main flags of the world', creatorId: '@petitstring', questionsCount: 45, bolt: 15, minutes: 5,),
                          MediumTitleWidget(text: AppLocalizations.of(context)!.playWithFriends),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0, bottom: 20.0),
                            child: SizedBox(
                              height: FriendPlaySuggestionWidget.height + 40,
                              child: ListView(
                                physics: const ClampingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                children: <Widget>[
                                  FriendPlaySuggestionWidget(name: 'Vivien', id: '@petitstring'),
                                  FriendPlaySuggestionWidget(name: 'Vivien', id: '@petitstring'),
                                  FriendPlaySuggestionWidget(name: 'Vivien', id: '@petitstring'),
                                  FriendPlaySuggestionWidget(name: 'Vivien', id: '@petitstring'),
                                  FriendPlaySuggestionWidget(name: 'Vivien', id: '@petitstring'),
                                  FriendPlaySuggestionWidget(name: 'Vivien', id: '@petitstring'),
                                  const SmallSeeMoreWidget(),
                                  Container(
                                    width: 20.0,
                                  )
                                ],
                              ),
                            ),
                          ),
                          QuizCommunityPresentationWidget(name: 'The main flags of the world', creatorId: '@petitstring', questionsCount: 45, bolt: 15, minutes: 5,),
                          QuizCommunityPresentationWidget(name: 'The main flags of the world', creatorId: '@petitstring', questionsCount: 45, bolt: 15, minutes: 5,),
                          QuizCommunityPresentationWidget(name: 'The main flags of the world', creatorId: '@petitstring', questionsCount: 45, bolt: 15, minutes: 5,),
                          QuizCommunityPresentationWidget(name: 'The main flags of the world', creatorId: '@petitstring', questionsCount: 45, bolt: 15, minutes: 5,),
                          QuizCommunityPresentationWidget(name: 'The main flags of the world', creatorId: '@petitstring', questionsCount: 45, bolt: 15, minutes: 5,),
                          QuizCommunityPresentationWidget(name: 'The main flags of the world', creatorId: '@petitstring', questionsCount: 45, bolt: 15, minutes: 5,),
                          QuizCommunityPresentationWidget(name: 'The main flags of the world', creatorId: '@petitstring', questionsCount: 45, bolt: 15, minutes: 5,),
                          QuizCommunityPresentationWidget(name: 'The main flags of the world', creatorId: '@petitstring', questionsCount: 45, bolt: 15, minutes: 5,),
                          QuizCommunityPresentationWidget(name: 'The main flags of the world', creatorId: '@petitstring', questionsCount: 45, bolt: 15, minutes: 5,),
                          QuizCommunityPresentationWidget(name: 'The main flags of the world', creatorId: '@petitstring', questionsCount: 45, bolt: 15, minutes: 5,),
                          QuizCommunityPresentationWidget(name: 'The main flags of the world', creatorId: '@petitstring', questionsCount: 45, bolt: 15, minutes: 5,),
                          QuizCommunityPresentationWidget(name: 'The main flags of the world', creatorId: '@petitstring', questionsCount: 45, bolt: 15, minutes: 5,),
                          QuizCommunityPresentationWidget(name: 'The main flags of the world', creatorId: '@petitstring', questionsCount: 45, bolt: 15, minutes: 5,),
                          QuizCommunityPresentationWidget(name: 'The main flags of the world', creatorId: '@petitstring', questionsCount: 45, bolt: 15, minutes: 5,),
                        ]
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),

        ]
      ),
    );
  }
}

class CategoriesList extends StatelessWidget {
  const CategoriesList({Key? key, required this.categories, required this.onPush}) : super(key: key);

  final List<Category> categories;
  final Function onPush;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: (){
              onPush(context, '/quiz/theme', {'categoryCode': categories[index].code, 'categoryName': loadTranslation(categories[index].name)});
            },
            child: CategoryPresentationWidget(
              category: loadTranslation(categories[index].name),
              progression: 0,
              themeCount: categories[index].themesCount,
              color: HexColor(categories[index].color),
              icon: stringToIcon(categories[index].icon),
            )
        );
      },
    );
  }
}