import 'package:flutter/material.dart';
import 'package:kouizapp/constants/customcolors.dart';


class SmallPrimaryButtonWidget extends StatelessWidget  {
  SmallPrimaryButtonWidget({Key? key, required this.text, required this.height, required this.width, this.onTap}) : super(key: key);

  final void Function()? onTap;
  final double height;
  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7.0),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[
                        CustomColors.mainPink,
                        CustomColors.mainPurple,
                      ]
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: onTap,
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
                    primary: CustomColors.white,
                    textStyle: const TextStyle(fontSize: 9.0, fontFamily: 'Roboto', letterSpacing: 0.5, fontWeight: FontWeight.w500, color: CustomColors.white)
                ),
                child: Text(text, style: const TextStyle(color: CustomColors.white),)
            ),
          ],
        ),
      ),
    );
  }
}