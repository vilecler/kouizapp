import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//import all required page
import 'package:kouizapp/pages/patterns/main/homepage.dart';
import 'package:kouizapp/pages/patterns/main/quizpage.dart';
import 'package:kouizapp/pages/patterns/main/messagespage.dart';
import 'package:kouizapp/pages/patterns/main/mepage.dart';

//To resolve colors
import '../../../constants/customcolors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

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

  static const double iconMarginNotToText = 4.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.white,
      child: Column(
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
              const BottomNavigationBarItem(
                icon: Padding(
                    padding: EdgeInsets.only(bottom: iconMarginNotToText),
                    child: FaIcon(FontAwesomeIcons.home)
                ),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Padding(
                    padding: EdgeInsets.only(bottom: iconMarginNotToText),
                    child: FaIcon(FontAwesomeIcons.book)
                ),
                label: 'Quiz',
              ),
              const BottomNavigationBarItem(
                icon: Padding(
                    padding: EdgeInsets.only(bottom: iconMarginNotToText),
                    child: FaIcon(FontAwesomeIcons.solidPaperPlane)
                ),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                    padding: const EdgeInsets.only(bottom: iconMarginNotToText),
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
            selectedLabelStyle: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w700, fontFamily: 'Roboto', decoration: TextDecoration.none),
            iconSize: 20.0,
            onTap: _onItemTapped,
          ),
        ]
      ),
    );
  }
}
