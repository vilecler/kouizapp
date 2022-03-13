import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/constants/customcolors.dart';

class SeeMoreWidget extends StatelessWidget {
  SeeMoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'See more',
            style: TextStyle(color: CustomColors.mainPurple, fontSize: 18.0, fontWeight: FontWeight.w600, fontFamily: 'Roboto'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: FaIcon(FontAwesomeIcons.arrowRight, color: CustomColors.mainPurple, size: 16.0,),
          )
        ],
      ),
    );
  }
}