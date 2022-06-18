import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/customcolors.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchBoxWidget extends StatefulWidget {
  const SearchBoxWidget({Key? key, this.onTextChanged, this.white = false}) : super(key: key);
  final Function(String newText)? onTextChanged;
  final bool white;

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
          onChanged: widget.onTextChanged,
          style: TextStyle(color: widget.white ? CustomColors.white :CustomColors.mainPurple, fontFamily: 'Roboto', fontSize: 16.0, fontWeight: FontWeight.w500, decoration: TextDecoration.none),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 20.0),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: widget.white ? CustomColors.white :CustomColors.mainPurple, width: 1.75),
                borderRadius: BorderRadius.circular(12.0)
            ),
            enabledBorder: OutlineInputBorder(
                borderSide:  BorderSide(color: widget.white ? CustomColors.white : CustomColors.mainPurple, width: 1.75),
                borderRadius: BorderRadius.circular(12.0),
            ),
            hintStyle: TextStyle(color: widget.white ? CustomColors.white : CustomColors.mainPurple, fontFamily: 'Roboto', fontSize: 14.0, fontWeight: FontWeight.w500, decoration: TextDecoration.none),
            focusColor: widget.white ? CustomColors.white : CustomColors.mainPurple,
            hoverColor: widget.white ? CustomColors.white : CustomColors.mainPurple,
            iconColor: widget.white ? CustomColors.white : CustomColors.mediumGrey,
            suffixIcon: SizedBox(
              height: 40.0,
              width: 70.0,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(12.0), topRight: Radius.circular(12.0)),
                        color: widget.white ? CustomColors.white : CustomColors.mainPurple,
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
                            widget.white ? CustomColors.white : CustomColors.mainPink,
                            widget.white ? CustomColors.white :CustomColors.white.withOpacity(0.0),
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
                            FaIcon(FontAwesomeIcons.search, color: widget.white ? CustomColors.mainPurple : CustomColors.white, size: 14.0,)
                          ],
                        ),
                      ),


                    ],
                  ),


                ],
              ),
            ),
            hintText: AppLocalizations.of(context)!.search + "...",
          ),
        ),
      ),
    );
  }
}
