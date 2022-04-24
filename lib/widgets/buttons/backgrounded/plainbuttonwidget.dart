import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/constants/customcolors.dart';


class PlainButtonWidget extends StatelessWidget  {
  PlainButtonWidget({Key? key, required this.text, required this.icon, this.onTap}) : super(key: key);

  final String text;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40.0),
        decoration: BoxDecoration(
          border: Border.all(
              color: CustomColors.white,
              width: 3.0
          ),
          borderRadius: BorderRadius.circular(12.0),
          color: CustomColors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: CustomColors.white.withOpacity(0.8),
              offset: const Offset(0.0, 0.0),
              blurRadius: 8.0,
              spreadRadius: 0.5,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(text, style: const TextStyle(decoration: TextDecoration.none, fontSize: 22.0, fontWeight: FontWeight.w600, fontFamily: 'Roboto', color: CustomColors.mainPurple, letterSpacing: 0.5),),
              ),
              FaIcon(icon, color: CustomColors.mainPurple, size: 20.0,)
            ],
          ),
        ),
      ),
    );
  }
}