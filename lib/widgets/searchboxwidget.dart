import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/customcolors.dart';

class SearchBoxWidget extends StatefulWidget {
  const SearchBoxWidget({Key? key}) : super(key: key);

  @override
  State<SearchBoxWidget> createState() => _SearchBoxWidgetState();
}

class _SearchBoxWidgetState extends State<SearchBoxWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      child: SizedBox(
        height: 35.0,
        child: TextField(
          textAlign: TextAlign.start,
          keyboardType: TextInputType.text,
          style: const TextStyle(color: CustomColors.mainPurple, fontFamily: 'Roboto', fontSize: 16.0, fontWeight: FontWeight.w500, decoration: TextDecoration.none),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 20.0),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: CustomColors.mainPurple, width: 1.75),
                borderRadius: BorderRadius.circular(12.0)
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: CustomColors.mainPurple, width: 1.75),
                borderRadius: BorderRadius.circular(12.0),
            ),
            hintStyle: const TextStyle(color: CustomColors.mainPurple, fontFamily: 'Roboto', fontSize: 14.0, fontWeight: FontWeight.w500, decoration: TextDecoration.none),
            focusColor: CustomColors.mainPurple,
            hoverColor: CustomColors.mainPurple,
            iconColor: CustomColors.mediumGrey,
            suffixIcon: Container(
              height: 40.0,
              width: 70.0,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(12.0), topRight: Radius.circular(12.0)),
                        color: CustomColors.mainPurple,
                    ),
                    height: 40.0,
                  ),

                  Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12.0), topRight: Radius.circular(12.0)),
                      gradient: LinearGradient(
                          end: FractionalOffset.topLeft,
                          begin: FractionalOffset.bottomRight,
                          colors: [
                            CustomColors.mainPink,
                            CustomColors.white.withOpacity(0.0),
                          ],
                          stops: const [0.0, 1.0]
                      ),
                    ),
                  ),


                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const FaIcon(FontAwesomeIcons.search, color: CustomColors.white, size: 14.0,)
                          ],
                        ),
                      ),


                    ],
                  ),




                ],
              ),
            ),
            hintText: "Search...",
          ),
        ),
      ),
    );
  }
}
