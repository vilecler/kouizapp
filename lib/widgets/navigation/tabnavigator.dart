import 'package:flutter/material.dart';
import 'package:kouizapp/pages/patterns/home/popularpage.dart';
import 'package:kouizapp/pages/patterns/main/homepage.dart';
import 'package:kouizapp/pages/patterns/main/messagespage.dart';
import 'package:kouizapp/pages/patterns/main/quizpage.dart';
import 'package:kouizapp/pages/patterns/quiz/quizlistpage.dart';
import 'package:kouizapp/pages/patterns/quiz/quizplaygroundpage.dart';
import 'package:kouizapp/pages/patterns/quiz/quizstartpage.dart';
import 'package:kouizapp/widgets/navigation/tabitem.dart';

import '../../pages/patterns/home/recentpage.dart';
import '../../pages/patterns/home/suggestionspage.dart';
import '../../pages/patterns/main/mepage.dart';
import '../../pages/patterns/quiz/themepage.dart';

class TabNavigatorRoutes {
  static const String home = '/home';
  static const String quiz = '/quiz';
  static const String messages = '/messages';
  static const String me = '/me';

  //Home subroutes
  static const String homeSuggestion = '/home/suggestion';
  static const String homeRecent = '/home/recent';
  static const String homePopular = '/home/popular';

  //Quiz subroutes
  static const String quizTheme = '/quiz/theme';
  static const String quizQuizList = '/quiz/theme/quiz-list';

  static const String quizStart = '/quiz/start';
  static const String quizStartStats = '/quiz/start/stats';
  static const String quizLobby = '/quiz/lobby';
  static const String quizPlayground = '/quiz/playground';
  static const String quizEnd = '/quiz/end';
  static const String quizEndRecap = '/quiz/end/recap';

  static const String quizLobbyInvite = '/quiz/lobby/invite';
  static const String quizInvite = '/quiz/invite';

}

class TabNavigator extends StatefulWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem, required this.hideBottomBarCallback, required this.displayBottomBarCallback});
  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;

  final Function hideBottomBarCallback;
  final Function displayBottomBarCallback;

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  void push(BuildContext context, String route) {
    var routeBuilders = _routeBuilders(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            routeBuilders[route]!(context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      TabNavigatorRoutes.home: (context) => HomePage(onPush: push),
      TabNavigatorRoutes.quiz: (context) => QuizPage(onPush: push),
      TabNavigatorRoutes.messages: (context) => MessagesPage(),
      TabNavigatorRoutes.me: (context) => MePage(),

      //Home subroutes
      TabNavigatorRoutes.homeSuggestion: (context) => SuggestionPage(),
      TabNavigatorRoutes.homeRecent: (context) => RecentPage(),
      TabNavigatorRoutes.homePopular: (context) => PopularPage(),

      //Quiz subroutes
      TabNavigatorRoutes.quizTheme: (context) => ThemePage(onPush: push),
      TabNavigatorRoutes.quizQuizList: (context) => QuizListPage(onPush: push),

      TabNavigatorRoutes.quizStart: (context) => QuizStartPage(onPush: push, hideBottomBarCallback: widget.hideBottomBarCallback, displayBottomBarCallback: widget.displayBottomBarCallback,),
      TabNavigatorRoutes.quizPlayground: (context) => QuizPlaygroundPage(onPush: push, hideBottomBarCallback: widget.hideBottomBarCallback, displayBottomBarCallback: widget.displayBottomBarCallback,),

    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);

    return Navigator(
      key: widget.navigatorKey,
      initialRoute: TabNavigatorRoutes.home,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) {
            return routeBuilders['/' + widget.tabItem.name]!(context);
          },
        );
      },
    );
  }
}