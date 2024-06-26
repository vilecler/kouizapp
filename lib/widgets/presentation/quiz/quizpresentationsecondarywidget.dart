import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:kouizapp/constants/customcolors.dart';
import 'package:kouizapp/widgets/buttons/small/smallsecondarybutton.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuizPresentationSecondaryWidget extends StatelessWidget {

  static const height = 120.0;
  static const width = 90.0;
  static const borderRadius = 20.0;

  QuizPresentationSecondaryWidget({Key? key, required this.name, required this.themePosition, required this.reward, required this.questionsCount, required this.bolt, required this.minutes}) : super(key: key);

  final String name;
  final String themePosition;
  final int reward;
  final int questionsCount;
  final int bolt;
  final int minutes;

  var f = NumberFormat("###,###", "en_US");

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
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
                              stops: [0.0, 1.0]
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
                              child: Text(themePosition, style: const TextStyle(color: CustomColors.white, fontSize: 20.0, fontFamily: 'Roboto', fontWeight: FontWeight.w600, decoration: TextDecoration.none),),
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
                    child: Text(name, style: const TextStyle(color: CustomColors.mainRed, fontWeight: FontWeight.w700, fontFamily: 'Roboto', fontSize: 18.0, decoration: TextDecoration.none),),
                  ),
                  Text(AppLocalizations.of(context)!.maximumReward + AppLocalizations.of(context)!.punctuationSpace + ': ' + f.format(reward) + AppLocalizations.of(context)!.xp, style: const TextStyle(color: CustomColors.redGrey, fontWeight: FontWeight.w500, fontFamily: 'Roboto', fontSize: 14.0, decoration: TextDecoration.none),),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(questionsCount.toString() + ' ' + ( (questionsCount == 0) ? AppLocalizations.of(context)!.question.toLowerCase() : AppLocalizations.of(context)!.questions.toLowerCase() )  + '.', style: const TextStyle(color: CustomColors.redGrey, fontWeight: FontWeight.w500, fontFamily: 'Roboto', fontSize: 14.0, decoration: TextDecoration.none),),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const FaIcon(FontAwesomeIcons.bolt, color: CustomColors.bolt, size: 18.0,),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(bolt.toString(), style: const TextStyle(color: CustomColors.mainOrange, fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: 16, decoration: TextDecoration.none),),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            const FaIcon(FontAwesomeIcons.hourglassHalf, color: CustomColors.mainOrange, size: 16.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(minutes.toString() + ' ' + AppLocalizations.of(context)!.min.toLowerCase() + '.', style: const TextStyle(color: CustomColors.mainOrange, fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: 16, decoration: TextDecoration.none),),
                            ),
                          ],
                        ),
                        SmallSecondaryButtonWidget(text: AppLocalizations.of(context)!.buy, height: 20.0, width: 50.0)


                      ]
                    ),
                  )

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}