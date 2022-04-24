import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants/customcolors.dart';

class AnswerWidget extends StatelessWidget {
  const AnswerWidget({Key? key, required this.answer}) : super(key: key);

  final String answer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.43,
      height: 80.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: CustomColors.white,
      ),
      child: Center(
        child: Text(
          answer,
          style: const TextStyle(color: CustomColors.mainPurple, fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
