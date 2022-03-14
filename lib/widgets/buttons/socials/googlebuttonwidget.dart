import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/constants/customcolors.dart';


class GoogleButtonWidget extends StatelessWidget  {
  GoogleButtonWidget({Key? key, required this.text, this.onTap}) : super(key: key);

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: CustomColors.googleColor,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: CustomColors.googleColor.withOpacity(0.8),
                offset: const Offset(0.0, 0.0),
                blurRadius: 8.0,
                spreadRadius: 0.5,
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FaIcon(FontAwesomeIcons.google, color: CustomColors.white, size: 17.0,),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(text, style: const TextStyle(decoration: TextDecoration.none, fontSize: 18.0, fontWeight: FontWeight.w400, fontFamily: 'Roboto', color: CustomColors.white),),
              )
            ],
          ),
        ),
      ),
    );
  }
}