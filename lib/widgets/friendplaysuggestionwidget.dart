import 'package:flutter/material.dart';
import 'package:kouizapp/constants/customcolors.dart';
import 'package:kouizapp/widgets/smallprimarybutton.dart';
import 'package:kouizapp/widgets/smallsecondarybutton.dart';

class FriendPlaySuggestionWidget extends StatelessWidget {

  FriendPlaySuggestionWidget({Key? key}) : super(key: key);

  static const height = 120.0;
  static const width = 120.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: CustomColors.mainPurple)
      ),
      margin: EdgeInsets.only(left: 15.0),
      height: height,
      width: width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: Image.asset('assets/images/profile_picture.png').image,
              radius: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text('Vivien', style: TextStyle(color: CustomColors.grey, fontSize: 14.0, fontWeight: FontWeight.w500, fontFamily: 'Roboto')),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text('@petitstring', style: TextStyle(color: CustomColors.grey, fontSize: 10.0, fontWeight: FontWeight.w300, fontFamily: 'Roboto')),
            ),
            SmallSecondaryButtonWidget(text: 'Invite', height: 20, width: 70)
          ],
        ),
      ),
    );
  }
}