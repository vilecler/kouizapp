import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//import all required page
import 'package:kouizapp/pages/home.dart';
import 'package:kouizapp/pages/quiz.dart';
import 'package:kouizapp/pages/messages.dart';
import 'package:kouizapp/pages/me.dart';

//To resolve colors
import '../constants/customcolors.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    QuizPage(),
    MessagesPage(),
    MePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const double _icon_margin_bot_to_text = 4.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          flex: 1,
          child: ListView(
            shrinkWrap: true,
            children: [_widgetOptions.elementAt(_selectedIndex)],
          ),
        ),
        Container(
            height:1.0,
            color: CustomColors.fakeWhite,
        ),
        BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.only(bottom: _icon_margin_bot_to_text),
                  child: FaIcon(FontAwesomeIcons.home)
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.only(bottom: _icon_margin_bot_to_text),
                  child: FaIcon(FontAwesomeIcons.book)
              ),
              label: 'Quiz',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.only(bottom: _icon_margin_bot_to_text),
                  child: FaIcon(FontAwesomeIcons.solidPaperPlane)
              ),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.only(bottom: _icon_margin_bot_to_text),
                  child: CircleAvatar(
                    backgroundImage: Image.asset('assets/images/profile_picture.png').image,
                    radius: 15,
                  )
              ),
              label: 'Me',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: CustomColors.mainPurple,
          unselectedItemColor: CustomColors.grey,
          backgroundColor: CustomColors.white,
          selectedLabelStyle: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w700, fontFamily: 'Roboto'),
          iconSize: 20.0,
          onTap: _onItemTapped,
        ),
      ]
    );
  }
}
