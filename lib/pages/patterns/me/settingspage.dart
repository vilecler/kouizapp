import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kouizapp/constants/customcolors.dart';
import 'package:kouizapp/services/auth_cognito.dart' as auth;
import 'package:kouizapp/utils/translation.dart';
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
            BackHeaderWidget(title: AppLocalizations.of(context)!.settings, bolt: 100),

            Flexible(
              child: SettingsList(
                lightTheme: themeData,
                sections: [
                  SettingsSection(
                    title: Text(AppLocalizations.of(context)!.general, style: sectionTextStyle),
                    tiles: [
                      SettingsTile(
                        title: Text(AppLocalizations.of(context)!.language),
                        description: Text(getLocaleValue(getSelectedLocale())),
                        leading: const FaIcon(FontAwesomeIcons.language),
                        onPressed: (BuildContext context) {},
                      ),
                      SettingsTile.switchTile(
                          leading: const FaIcon(FontAwesomeIcons.solidBell),
                          initialValue: true,
                          onToggle: (value) { },
                          title: Text(AppLocalizations.of(context)!.allowNotifications)
                      )
                    ],
                  ),

                  SettingsSection(
                    title: Text(AppLocalizations.of(context)!.user, style: sectionTextStyle),
                    tiles: [
                      SettingsTile(
                        title: Text(AppLocalizations.of(context)!.username),
                        description: Text('petitstring'),
                        leading: const FaIcon(FontAwesomeIcons.userAlt),
                        onPressed: (BuildContext context) {},
                      ),
                      SettingsTile(
                        title: Text(AppLocalizations.of(context)!.pseudo),
                        description: Text('@petitstring'),
                        leading: const FaIcon(FontAwesomeIcons.userAlt),
                        onPressed: (BuildContext context) {},
                      ),
                      SettingsTile(
                        title: Text(AppLocalizations.of(context)!.email),
                        description: Text('vivien.leclercq@gmail.com'),
                        leading: const FaIcon(FontAwesomeIcons.solidEnvelope),
                        onPressed: (BuildContext context) {},
                      ),
                      SettingsTile(
                        title: Text(AppLocalizations.of(context)!.password),
                        description: Text('***********'),
                        leading: const FaIcon(FontAwesomeIcons.lock),
                        onPressed: (BuildContext context) {},
                      ),
                      SettingsTile(
                        title: Text(AppLocalizations.of(context)!.disconnect),
                        leading: const FaIcon(FontAwesomeIcons.userAltSlash),
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