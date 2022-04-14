import 'package:flutter/material.dart';
import 'package:kouizapp/pages/patterns/home/mostpopularpage.dart';
import 'package:kouizapp/pages/patterns/main/homepage.dart';
import 'package:kouizapp/pages/patterns/main/messagespage.dart';
import 'package:kouizapp/pages/patterns/main/quizpage.dart';
import 'package:kouizapp/widgets/navigation/tabitem.dart';

import '../../pages/patterns/main/mepage.dart';

class TabNavigatorRoutes {
  static const String home = '/home';
  static const String quiz = '/quiz';
  static const String messages = '/messages';
  static const String me = '/me';

  //Home subroutes
  static const String mostpopular = '/mostpopular';
}

class TabNavigator extends StatefulWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;

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
      TabNavigatorRoutes.quiz: (context) => QuizPage(),
      TabNavigatorRoutes.messages: (context) => MessagesPage(),
      TabNavigatorRoutes.me: (context) => MePage(),

      TabNavigatorRoutes.mostpopular: (context) => MostPopularPage(),
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