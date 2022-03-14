import 'package:flutter/material.dart';
import 'package:kouizapp/constants/customcolors.dart';
import 'package:kouizapp/widgets/smallsecondarybutton.dart';

class BoxPrimaryWidget extends StatelessWidget {
  const BoxPrimaryWidget({Key? key, required this.title, required this.subTitle, required this.text, this.onClick}) : super(key: key);

  final String title;
  final String subTitle;
  final String text;
  final void Function()? onClick;

  static const height = 180.0;
  static const width = 280.0;
  static const borderRadius = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0),
      height: height,
      width: width,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: CustomColors.mainPurple,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: CustomColors.mainPurple.withOpacity(0.8),
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 12.0,
                  spreadRadius: 1.5,
                )
              ]
            ),
            height: height,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(borderRadius),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/home-header-1.png'
                ),
              ),
            ),
            height: height,
          ),
          Container(
            height: height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(borderRadius),
              gradient: LinearGradient(
                  end: FractionalOffset.topRight,
                  begin: FractionalOffset.bottomLeft,
                  colors: [
                    CustomColors.mainPink,
                    CustomColors.white.withOpacity(0.0),
                  ],
                  stops: const [0.0, 1.0]
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    title,
                    style: const TextStyle(color: CustomColors.white, fontSize: 24.0, decoration: TextDecoration.none, fontWeight: FontWeight.w800, letterSpacing: 2.0, fontFamily: 'Roboto'),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    subTitle,
                    style: TextStyle(color: CustomColors.white.withOpacity(0.75), fontSize: 15.0, decoration: TextDecoration.none, fontWeight: FontWeight.w500, letterSpacing: 1.0, fontFamily: 'Roboto'),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    text,
                    style: TextStyle(color: CustomColors.white.withOpacity(0.5), fontSize: 11.0, decoration: TextDecoration.none, fontWeight: FontWeight.w500, letterSpacing: 0.5, fontFamily: 'Roboto'),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SmallSecondaryButtonWidget(text: 'Start', height: 20.0, width: 50.0, onTap: onClick),
                )


              ],
            ),
          ),




        ],
      ),
    );
  }
}