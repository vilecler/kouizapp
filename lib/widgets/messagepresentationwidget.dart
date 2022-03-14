import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/constants/customcolors.dart';

class MessagePresentationWidget extends StatelessWidget  {
  const MessagePresentationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 30.0, top: 5.0, bottom: 5.0),
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: CircleAvatar(
                  backgroundImage: Image.asset('assets/images/profile_picture.png').image,
                  radius: 25,
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
                          Text('Vivien', style: const TextStyle(color: CustomColors.grey, fontWeight: FontWeight.w700, fontFamily: 'Roboto', fontSize: 18.0, decoration: TextDecoration.none),),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text('@petitstring', style: const TextStyle(color: CustomColors.grey, fontWeight: FontWeight.w400, fontFamily: 'Roboto', fontSize: 12.0, decoration: TextDecoration.none),),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          FaIcon(FontAwesomeIcons.checkDouble, color: CustomColors.grey, size: 10.0,),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text('16:30', style: const TextStyle(color: CustomColors.grey, fontWeight: FontWeight.w600, fontSize: 12.0, fontFamily: 'Roboto', decoration: TextDecoration.none),),
                          )
                        ],
                      )
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      'This is an example of text just to see if it woks well.',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: CustomColors.grey, fontWeight: FontWeight.w400, fontSize: 13.0, fontFamily: 'Roboto', decoration: TextDecoration.none),
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