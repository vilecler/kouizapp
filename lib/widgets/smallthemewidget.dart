import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/constants/customcolors.dart';


class SmallThemeWidget extends StatelessWidget  {
  const SmallThemeWidget({Key? key, required this.color, required this.text, required this.icon}) : super(key: key);

  final Color color;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5.0)
          ),
          child: Center(
            child: FaIcon(
              icon,
              color: CustomColors.white,
              size: 25.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            text,
            style: const TextStyle(fontSize: 14.0, color: CustomColors.grey, fontFamily: 'Roboto', decoration: TextDecoration.none, fontWeight: FontWeight.w500),
          ),
        )
      ]
    );
  }
}