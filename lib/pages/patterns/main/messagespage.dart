import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/widgets/searchboxwidget.dart';

import '../../../constants/customcolors.dart';
import '../../../widgets/boltwidget.dart';
import '../../../widgets/messagepresentationwidget.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0, left: 20.0, right: 20.0, top: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Messages',
                style: const TextStyle(color: CustomColors.mainPurple, fontFamily: 'Roboto', fontWeight: FontWeight.w800, fontSize: 34.0, decoration: TextDecoration.none),
              ),
              BoltWidget(text: '100'),
            ],
          ),
        ),

        Material(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Flexible(
                child: SearchBoxWidget(),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.0, bottom: 7.0),
                child: FaIcon(FontAwesomeIcons.edit, color: CustomColors.grey, size: 26.0,),
              ),
            ],
          ),
        ),


        MessagePresentationWidget(),
        MessagePresentationWidget(),
        MessagePresentationWidget(),
        MessagePresentationWidget(),
        MessagePresentationWidget(),
        MessagePresentationWidget(),
        MessagePresentationWidget(),
        MessagePresentationWidget(),
        MessagePresentationWidget(),
        MessagePresentationWidget(),
        MessagePresentationWidget(),

      ]
    );;
  }
}