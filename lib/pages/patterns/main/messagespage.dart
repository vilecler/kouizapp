import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/widgets/searchboxwidget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants/customcolors.dart';
import '../../../widgets/boltwidget.dart';
import '../../../widgets/hearders/hearderwidget.dart';
import '../../../widgets/presentation/message/messagepresentationwidget.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderWidget(title: AppLocalizations.of(context)!.messages, bolt: 100),

          Material(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Flexible(
                  child: SearchBoxWidget(),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.0, bottom: 7.0),
                  child: FaIcon(FontAwesomeIcons.edit, color: CustomColors.alternativePurple, size: 26.0,),
                ),
              ],
            ),
          ),


          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: const <MessagePresentationWidget>[
                  MessagePresentationWidget(name: 'Vivien', id: '@petitstring', text: 'This is just a text message to test the app design.', time: '16:30'),
                  MessagePresentationWidget(name: 'Vivien', id: '@petitstring', text: 'This is just a text message to test the app design.', time: '16:30'),
                  MessagePresentationWidget(name: 'Vivien', id: '@petitstring', text: 'This is just a text message to test the app design.', time: '16:30'),
                  MessagePresentationWidget(name: 'Vivien', id: '@petitstring', text: 'This is just a text message to test the app design.', time: '16:30'),
                  MessagePresentationWidget(name: 'Vivien', id: '@petitstring', text: 'This is just a text message to test the app design.', time: '16:30'),
                  MessagePresentationWidget(name: 'Vivien', id: '@petitstring', text: 'This is just a text message to test the app design.', time: '16:30'),
                  MessagePresentationWidget(name: 'Vivien', id: '@petitstring', text: 'This is just a text message to test the app design.', time: '16:30'),
                  MessagePresentationWidget(name: 'Vivien', id: '@petitstring', text: 'This is just a text message to test the app design.', time: '16:30'),
                  MessagePresentationWidget(name: 'Vivien', id: '@petitstring', text: 'This is just a text message to test the app design.', time: '16:30'),
                  MessagePresentationWidget(name: 'Vivien', id: '@petitstring', text: 'This is just a text message to test the app design.', time: '16:30'),
                  MessagePresentationWidget(name: 'Vivien', id: '@petitstring', text: 'This is just a text message to test the app design.', time: '16:30'),
                  MessagePresentationWidget(name: 'Vivien', id: '@petitstring', text: 'This is just a text message to test the app design.', time: '16:30'),
                ],
              ),
            ),
          ),

        ]
      ),
    );;
  }
}