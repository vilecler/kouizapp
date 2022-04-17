import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/constants/customcolors.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryPresentationWidget extends StatelessWidget {

  static const height = 75.0;
  static const width = 75.0;
  static const borderRadius = 20.0;

  const CategoryPresentationWidget({Key? key}) : super(key: key);

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

                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(FontAwesomeIcons.globeAfrica, color: CustomColors.white, size: 35,),
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
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 11.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Geography', style: const TextStyle(color: CustomColors.mainPurple, fontWeight: FontWeight.w700, fontFamily: 'Roboto', fontSize: 18.0, decoration: TextDecoration.none),),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Text(AppLocalizations.of(context)!.select, style: TextStyle(color: CustomColors.mainPurple, fontWeight: FontWeight.w400, fontFamily: 'Roboto', fontSize: 12.0)),
                            ),
                            FaIcon(FontAwesomeIcons.arrowRight, size: 12.0, color: CustomColors.mainPurple,)
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)!.progression + AppLocalizations.of(context)!.punctuationSpace + ': 80%', style: const TextStyle(color: CustomColors.purpleGrey, fontWeight: FontWeight.w500, fontFamily: 'Roboto', fontSize: 14.0, decoration: TextDecoration.none),),
                      Text(AppLocalizations.of(context)!.themes + AppLocalizations.of(context)!.punctuationSpace + ': 56', style: const TextStyle(color: CustomColors.purpleGrey, fontWeight: FontWeight.w500, fontFamily: 'Roboto', fontSize: 14.0, decoration: TextDecoration.none),),
                    ],
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