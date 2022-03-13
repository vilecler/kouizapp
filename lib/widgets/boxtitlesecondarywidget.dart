import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/constants/customcolors.dart';
import 'package:kouizapp/widgets/smallsecondarybutton.dart';

class BoxTitleSecondaryWidget extends StatelessWidget {

  BoxTitleSecondaryWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  static const height = 100.0;
  static const borderRadius = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0),
      height: height,
      //width: width,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                color: CustomColors.mainRed,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: CustomColors.mainRed.withOpacity(0.7),
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
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    'assets/images/home-header-2.png'
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
                    CustomColors.mainOrange.withOpacity(0.7),
                    Colors.white.withOpacity(0.0),
                  ],
                  stops: [0.0, 1.0]
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Text(
                          title,
                          style: TextStyle(color: CustomColors.white, fontSize: 23.0, decoration: TextDecoration.none, fontWeight: FontWeight.w800, letterSpacing: 1.0, fontFamily: 'Roboto'),
                        ),
                      ),
                      FaIcon(FontAwesomeIcons.arrowRight, color: CustomColors.white, size: 19.0,)
                    ],
                  ),
                ),


              ],
            ),
          ),




        ],
      ),
    );
  }
}