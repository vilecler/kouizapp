import 'package:flutter/material.dart';
import 'package:kouizapp/constants/customcolors.dart';
import 'package:kouizapp/widgets/buttons/small/smallprimarybutton.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FriendSuggestionWidget extends StatelessWidget {
  const FriendSuggestionWidget({Key? key, required this.name, required this.id}) : super(key: key);

  final String name;
  final String id;

  static const height = 120.0;
  static const width = 120.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: CustomColors.mainPurple)
      ),
      margin: const EdgeInsets.only(left: 15.0),
      height: height,
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: Image.asset('assets/images/profile_picture.png').image,
              radius: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text(name, style: const TextStyle(color: CustomColors.grey, fontSize: 14.0, fontWeight: FontWeight.w500, fontFamily: 'Roboto', decoration: TextDecoration.none)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(id, style: const TextStyle(color: CustomColors.grey, fontSize: 10.0, fontWeight: FontWeight.w300, fontFamily: 'Roboto', decoration: TextDecoration.none)),
            ),
            SmallPrimaryButtonWidget(text: AppLocalizations.of(context)!.addFriend, height: 20, width: 70)
          ],
        ),
      ),
    );
  }
}