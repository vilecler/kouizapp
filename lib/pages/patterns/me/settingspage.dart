import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kouizapp/constants/customcolors.dart';
import 'package:kouizapp/services/auth_cognito.dart' as auth;
import 'package:kouizapp/utils/translation.dart';
import 'package:kouizapp/widgets/titles/mediumtitlewidget.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../widgets/hearders/backheaderwidget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key, required this.onPush}) : super(key: key);

  final Function onPush;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final sectionTextStyle = const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700);

  SettingsThemeData themeData = const SettingsThemeData(
    settingsListBackground: CustomColors.lightWhite,
    titleTextColor: CustomColors.mainPurple,
    tileHighlightColor: CustomColors.mediumGrey,
    settingsTileTextColor: CustomColors.purpleGrey,
    tileDescriptionTextColor: CustomColors.mainPink,
    leadingIconsColor: CustomColors.purpleGrey,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackHeaderWidget(title: "Settings", bolt: 100),

            Flexible(
              child: SettingsList(
                lightTheme: themeData,
                sections: [
                  SettingsSection(
                    title: Text('Application', style: sectionTextStyle),
                    tiles: [
                      SettingsTile(
                        title: Text('Language'),
                        description: Text(getLocaleValue(getSelectedLocale())),
                        leading: FaIcon(FontAwesomeIcons.language),
                        onPressed: (BuildContext context) {},
                      ),
                      SettingsTile.switchTile(
                          leading: FaIcon(FontAwesomeIcons.bell),
                          initialValue: true,
                          onToggle: (value) { },
                          title: Text('Allow notifications')
                      )
                    ],
                  ),

                  SettingsSection(
                    title: Text('User', style: sectionTextStyle),
                    tiles: [
                      SettingsTile(
                        title: Text('Username'),
                        description: Text('petitstring'),
                        leading: FaIcon(FontAwesomeIcons.user),
                        onPressed: (BuildContext context) {},
                      ),
                      SettingsTile(
                        title: Text('Pseudo'),
                        description: Text('@petitstring'),
                        leading: FaIcon(FontAwesomeIcons.user),
                        onPressed: (BuildContext context) {},
                      ),
                      SettingsTile(
                        title: Text('Email'),
                        description: Text('vivien.leclercq@gmail.com'),
                        leading: FaIcon(FontAwesomeIcons.user),
                        onPressed: (BuildContext context) {},
                      ),
                      SettingsTile(
                        title: Text('Password'),
                        description: Text('***********'),
                        leading: FaIcon(FontAwesomeIcons.user),
                        onPressed: (BuildContext context) {},
                      ),
                      SettingsTile(
                        title: Text('Disconnect'),
                        leading: FaIcon(FontAwesomeIcons.user),
                        onPressed: (BuildContext context) async {
                          await auth.disconnect();
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                      )
                    ],
                  )
                ],
              ),
            )
          ]
      ),
    );
  }
}