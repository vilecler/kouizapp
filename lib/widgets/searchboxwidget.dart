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
        height: 40.0,
        child: TextField(
          textAlign: TextAlign.start,
          keyboardType: TextInputType.text,
          style: const TextStyle(color: CustomColors.mainPurple, fontFamily: 'Roboto', fontSize: 16.0, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: CustomColors.mainPurple, width: 2.0),
                borderRadius: BorderRadius.circular(15.0)
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: CustomColors.mediumGrey, width: 2.0),
                borderRadius: BorderRadius.circular(15.0)
            ),
            hintStyle: const TextStyle(color: CustomColors.mediumGrey, fontFamily: 'Roboto', fontSize: 14.0, fontWeight: FontWeight.w500),
            focusColor: CustomColors.mainPurple,
            hoverColor: CustomColors.mainPurple,
            iconColor: CustomColors.mediumGrey,
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 12.0,),
              child: SizedBox(
                width: 30,
                height: 40.0,
                child: Center(
                  child: FaIcon(FontAwesomeIcons.search, size: 15.0),
                ),
              ),
            ),
            hintText: "Search...",
          ),
        ),
      ),
    );
  }
}
