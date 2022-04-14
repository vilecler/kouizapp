import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/constants/customcolors.dart';
import 'package:kouizapp/widgets/buttons/small/smallsecondarybutton.dart';

class QuizHistoryPresentationSecondaryWidget extends StatelessWidget {

  static const height = 110.0;
  static const width = 90.0;
  static const borderRadius = 20.0;

  const QuizHistoryPresentationSecondaryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, top: 5.0, bottom: 5.0),
      child: Padding(
        padding: const EdgeInsets.only(right: 25.0),
        child: Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: SizedBox(
                      height: height,
                      width: width,

                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(borderRadius),
                                color: CustomColors.mainRed,
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: CustomColors.mainRed.withOpacity(0.8),
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 8.0,
                                    spreadRadius: 0.5,
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
                                    'assets/images/item-texture-2.png'
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
                                    CustomColors.mainOrange.withOpacity(0.8),
                                    CustomColors.white.withOpacity(0.0),
                                  ],
                                  stops: const [0.0, 1.0]
                              ),
                            ),
                          ),

                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const FaIcon(FontAwesomeIcons.crown, color: CustomColors.white, size: 35,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text('N°1', style: const TextStyle(color: CustomColors.white, fontSize: 20.0, fontFamily: 'Roboto', fontWeight: FontWeight.w600, decoration: TextDecoration.none),),
                                )
                              ],
                            ),
                          ),

                        ],
                      )


                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 11.0),
                      child: Text('The main flags of the world', style: const TextStyle(color: CustomColors.mainPurple, fontWeight: FontWeight.w700, fontFamily: 'Roboto', fontSize: 18.0, decoration: TextDecoration.none),),
                    ),
                    Text('Played on 24 February 2022.', style: const TextStyle(color: CustomColors.purpleGrey, fontWeight: FontWeight.w500, fontFamily: 'Roboto', fontSize: 14.0, decoration: TextDecoration.none),),

                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: Text('Score:', style: const TextStyle(color: CustomColors.mainOrange, fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: 16, decoration: TextDecoration.none),),
                                ),
                                Row(
                                  children: [
                                    FaIcon(FontAwesomeIcons.solidStar, color: CustomColors.mainOrange, size: 12.0,),
                                    FaIcon(FontAwesomeIcons.solidStar, color: CustomColors.mainOrange, size: 12.0,),
                                    FaIcon(FontAwesomeIcons.solidStar, color: CustomColors.mainOrange, size: 12.0,),
                                    FaIcon(FontAwesomeIcons.starHalfAlt, color: CustomColors.mainOrange, size: 12.0,),
                                    FaIcon(FontAwesomeIcons.star, color: CustomColors.mainOrange, size: 12.0,),
                                  ],
                                )

                              ],
                            ),
                            SmallSecondaryButtonWidget(text: 'Play again', height: 20.0, width: 80.0)


                          ]
                      ),
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}