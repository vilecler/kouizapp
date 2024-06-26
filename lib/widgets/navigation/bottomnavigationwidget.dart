import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/widgets/navigation/tabitem.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants/customcolors.dart';

class BottomNavigationWidget extends StatelessWidget {
  BottomNavigationWidget({required this.currentTab, required this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  static const double iconMarginNotToText = 4.0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Padding(
              padding: EdgeInsets.only(bottom: iconMarginNotToText),
              child: FaIcon(FontAwesomeIcons.home)
          ),
          label: AppLocalizations.of(context)!.home,
        ),
        BottomNavigationBarItem(
          icon: const Padding(
              padding: EdgeInsets.only(bottom: iconMarginNotToText),
              child: FaIcon(FontAwesomeIcons.book)
          ),
          label: AppLocalizations.of(context)!.quiz,
        ),
        BottomNavigationBarItem(
          icon: const Padding(
              padding: EdgeInsets.only(bottom: iconMarginNotToText),
              child: FaIcon(FontAwesomeIcons.solidPaperPlane)
          ),
          label: AppLocalizations.of(context)!.messages,
        ),
        BottomNavigationBarItem(
          icon: Padding(
              padding: const EdgeInsets.only(bottom: iconMarginNotToText),
              child: CircleAvatar(
                backgroundImage: Image.asset('assets/images/profile_picture.png').image,
                radius: 15,
              )
          ),
          label: AppLocalizations.of(context)!.me,
        ),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
      currentIndex: currentTab.index,
      selectedItemColor: CustomColors.mainPurple,
      unselectedItemColor: CustomColors.grey,
      backgroundColor: CustomColors.white,
      selectedLabelStyle: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w700, fontFamily: 'Roboto', decoration: TextDecoration.none),
      iconSize: 20.0,
    );
  }
}