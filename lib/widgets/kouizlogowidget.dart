import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/constants/customcolors.dart';

import '../main.dart';

class KouizLogoWidget extends StatelessWidget  {
  const KouizLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FaIcon(FontAwesomeIcons.crown, color: CustomColors.white, size: 100.0,),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(MyApp.appName.toUpperCase(), style: const TextStyle(decoration: TextDecoration.none, color: CustomColors.white, fontSize: 28.0, letterSpacing: 5.0, fontFamily: 'Roboto', fontWeight: FontWeight.w700),),
        )
      ],
    );
  }
}