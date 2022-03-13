import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/constants/customcolors.dart';


class BoltWidget extends StatelessWidget  {
  BoltWidget({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(
            text,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: CustomColors.mainPurple, decoration: TextDecoration.none, fontFamily: 'Roboto'),
          ),
        ),
        const FaIcon(FontAwesomeIcons.bolt, color: CustomColors.bolt, size: 17.0,),
      ]
    );
  }
}