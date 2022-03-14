import 'package:flutter/material.dart';
import 'package:kouizapp/constants/customcolors.dart';


class BigTitleWidget extends StatelessWidget  {
  const BigTitleWidget({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(text, style: const TextStyle(color: CustomColors.mainPurple, fontWeight: FontWeight.w700, fontFamily: 'Roboto', fontSize: 26.0, decoration: TextDecoration.none)),
        ],
      ),
    );
  }
}