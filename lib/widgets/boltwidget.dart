import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/constants/customcolors.dart';


class BoltWidget extends StatelessWidget  {
  const BoltWidget({Key? key, required this.number, this.white=false}) : super(key: key);

  final int number;
  final bool white;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(
            number.toString(),
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700, color: white ? CustomColors.white : CustomColors.mainPurple, decoration: TextDecoration.none, fontFamily: 'Roboto'),
          ),
        ),
        FaIcon(FontAwesomeIcons.bolt, color: white ? CustomColors.white : CustomColors.bolt, size: 17.0,),
      ]
    );
  }
}