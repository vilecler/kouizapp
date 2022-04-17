import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/constants/customcolors.dart';
import 'package:kouizapp/widgets/buttons/small/smallprimarybutton.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuizCommunityPresentationWidget extends StatelessWidget {

  static const height = 120.0;
  static const width = 90.0;
  static const borderRadius = 20.0;

  const QuizCommunityPresentationWidget({Key? key}) : super(key: key);

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
                              color: CustomColors.mainPurple,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: CustomColors.mainPurple.withOpacity(0.8),
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
                                  'assets/images/item-texture-1.png'
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

                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              FaIcon(FontAwesomeIcons.crown, color: CustomColors.white, size: 35,)
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
                    padding: const EdgeInsets.only(bottom: 7.0),
                    child: Text('The main flags of the world', style: TextStyle(color: CustomColors.mainPurple, fontWeight: FontWeight.w700, fontFamily: 'Roboto', fontSize: 18.0, decoration: TextDecoration.none),),
                  ),
                  Row(
                    children: [
                      Text(AppLocalizations.of(context)!.createdBy + AppLocalizations.of(context)!.punctuationSpace + ':', style: TextStyle(color: CustomColors.purpleGrey, fontWeight: FontWeight.w500, fontFamily: 'Roboto', fontSize: 14.0, decoration: TextDecoration.none),),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text('@petitstring', style: TextStyle(color: CustomColors.mainPink, fontWeight: FontWeight.w400, fontFamily: 'Roboto', fontSize: 14.0, decoration: TextDecoration.none),),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Row(
                      children: [
                        Text('45 ' + AppLocalizations.of(context)!.questions.toLowerCase() + '.', style: const TextStyle(color: CustomColors.purpleGrey, fontWeight: FontWeight.w500, fontFamily: 'Roboto', fontSize: 14.0, decoration: TextDecoration.none),),

                      ],
                    ),
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
                                child: Text('15', style: const TextStyle(color: CustomColors.mainPurple, fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: 16, decoration: TextDecoration.none),),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              const FaIcon(FontAwesomeIcons.hourglassHalf, color: CustomColors.mainPurple, size: 16.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text('5 ' + AppLocalizations.of(context)!.min.toLowerCase() + '.', style: const TextStyle(color: CustomColors.mainPurple, fontFamily: 'Roboto', fontWeight: FontWeight.w600, fontSize: 16, decoration: TextDecoration.none),),
                              ),
                            ],
                          ),
                          SmallPrimaryButtonWidget(text: AppLocalizations.of(context)!.play, height: 20.0, width: 50.0)
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