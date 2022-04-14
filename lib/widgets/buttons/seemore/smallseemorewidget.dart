import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/constants/customcolors.dart';

class SmallSeeMoreWidget extends StatelessWidget {
  const SmallSeeMoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Text(
            'See more',
            style: const TextStyle(color: CustomColors.mainPurple, fontSize: 14.0, fontWeight: FontWeight.w600, fontFamily: 'Roboto', decoration: TextDecoration.none),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: FaIcon(FontAwesomeIcons.arrowRight, color: CustomColors.mainPurple, size: 12.0,),
          )
        ],
      ),
    );
  }
}