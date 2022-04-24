import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../constants/customcolors.dart';
import '../boltwidget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key, required this.title, required this.bolt, this.small = false}) : super(key: key);

  final String title;
  final int bolt;

  final bool small;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: CustomColors.mainPurple, fontFamily: 'Roboto', fontWeight: FontWeight.w800, fontSize: small ? 26.0 : 34.0, decoration: TextDecoration.none),
          ),
          BoltWidget(number: bolt),
        ],
      ),
    );
  }
}
