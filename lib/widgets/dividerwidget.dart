import 'package:flutter/material.dart';
import 'package:kouizapp/constants/customcolors.dart';


class DividerWidget extends StatelessWidget  {
  const DividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        height: 15.0,
        width: double.infinity,
        color: CustomColors.lightGrey,
      ),
    );
  }
}