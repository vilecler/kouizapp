import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/constants/customcolors.dart';

class BoxTitlePrimaryWidget extends StatelessWidget {
  const BoxTitlePrimaryWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  static const height = 65.0;
  static const borderRadius = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      height: height,
      //width: width,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
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
              borderRadius: BorderRadius.circular(20.0),
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
              borderRadius: BorderRadius.circular(20.0),
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
            padding: const EdgeInsets.all(10.0),
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
                          style: const TextStyle(color: CustomColors.white, fontSize: 23.0, decoration: TextDecoration.none, fontWeight: FontWeight.w800, letterSpacing: 2.0, fontFamily: 'Roboto'),
                        ),
                      ),
                      const FaIcon(FontAwesomeIcons.arrowRight, color: CustomColors.white, size: 19.0,)
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