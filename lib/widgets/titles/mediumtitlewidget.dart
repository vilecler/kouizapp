import 'package:flutter/material.dart';
import 'package:kouizapp/constants/customcolors.dart';


class MediumTitleWidget extends StatelessWidget  {
  const MediumTitleWidget({Key? key, required this.text, this.white = false}) : super(key: key);

  final String text;
  final bool white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(text, style: TextStyle(color: white ? CustomColors.white : CustomColors.mainPurple, fontWeight: FontWeight.w700, fontFamily: 'Roboto', fontSize: 20.0, decoration: TextDecoration.none)),
        ],
      ),
    );
  }
}