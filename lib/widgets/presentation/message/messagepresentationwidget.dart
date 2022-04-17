import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/constants/customcolors.dart';

class MessagePresentationWidget extends StatelessWidget  {
  const MessagePresentationWidget({Key? key, required this.name, required this.id, required this.text, required this.time}) : super(key: key);

  final String name;
  final String id;
  final String text;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 30.0, top: 6.0, bottom: 6.0),
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: CircleAvatar(
                  backgroundImage: Image.asset('assets/images/profile_picture.png').image,
                  radius: 30,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(name, style: const TextStyle(color: CustomColors.mainPurple, fontWeight: FontWeight.w700, fontFamily: 'Roboto', fontSize: 18.0, decoration: TextDecoration.none),),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(id, style: const TextStyle(color: CustomColors.mainPurple, fontWeight: FontWeight.w400, fontFamily: 'Roboto', fontSize: 12.0, decoration: TextDecoration.none),),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          FaIcon(FontAwesomeIcons.checkDouble, color: CustomColors.grey, size: 10.0,),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text(time, style: const TextStyle(color: CustomColors.grey, fontWeight: FontWeight.w600, fontSize: 12.0, fontFamily: 'Roboto', decoration: TextDecoration.none),),
                          )
                        ],
                      )
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      text,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: CustomColors.purpleGrey, fontWeight: FontWeight.w400, fontSize: 13.0, fontFamily: 'Roboto', decoration: TextDecoration.none),
                    ),
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}