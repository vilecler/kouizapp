import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/constants/customcolors.dart';

import '../boltwidget.dart';

class BackHeaderWidget extends StatelessWidget {
  const BackHeaderWidget({Key? key, required this.title, required this.bolt, this.small = false, this.white = false}) : super(key: key);

  final String title;
  final int bolt;

  final bool small;
  final bool white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: FaIcon(FontAwesomeIcons.angleLeft, color: white ? CustomColors.white : CustomColors.mainPurple, size: 30.0,)
                ),
              ),
              Text(
                title,
                style: TextStyle(color: white ? CustomColors.white : CustomColors.mainPurple, fontFamily: 'Roboto', fontWeight: FontWeight.w800, fontSize: small ? 22.0 : 34.0, decoration: TextDecoration.none),
              ),
            ],
          ),
          BoltWidget(number: bolt, white: white,),
        ],
      ),
    );
  }
}
