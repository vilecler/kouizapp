import 'package:flutter/material.dart';
import 'package:kouizapp/widgets/navigation/bottomnavigationwidget.dart';

//To resolve colors
import '../../../widgets/navigation/tabitem.dart';
import '../../../widgets/navigation/tabnavigator.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentTab = TabItem.home;
  final _navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.quiz: GlobalKey<NavigatorState>(),
    TabItem.messages: GlobalKey<NavigatorState>(),
    TabItem.me: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    debugPrint('_selectTab() 1');
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState((){
        debugPrint('Tabbar state change: ' + tabItem.name);
        _currentTab = tabItem;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.home) {
            // select 'main' tab
            _selectTab(TabItem.home);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.home),
          _buildOffstageNavigator(TabItem.quiz),
          _buildOffstageNavigator(TabItem.messages),
          _buildOffstageNavigator(TabItem.me),
        ]),
        bottomNavigationBar: BottomNavigationWidget(currentTab: _currentTab, onSelectTab: _selectTab)
      )
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    debugPrint('_buildOffstageNavigator: ' + tabItem.name);
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
