import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kouizapp/constants/customcolors.dart';
import 'package:kouizapp/widgets/smallprimarybutton.dart';
import 'package:kouizapp/widgets/smallsecondarybutton.dart';


class MessagePresentationWidget extends StatelessWidget  {
  const MessagePresentationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 30.0, top: 5.0, bottom: 5.0),
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
                          Text('Vivien', style: TextStyle(color: CustomColors.grey, fontWeight: FontWeight.w700, fontFamily: 'Roboto', fontSize: 18.0),),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text('@petitstring', style: TextStyle(color: CustomColors.grey, fontWeight: FontWeight.w400, fontFamily: 'Roboto', fontSize: 12.0),),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          FaIcon(FontAwesomeIcons.checkDouble, color: CustomColors.grey, size: 10.0,),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text('16:30', style: TextStyle(color: CustomColors.grey, fontWeight: FontWeight.w600, fontSize: 12.0, fontFamily: 'Roboto'),),
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
                      style: TextStyle(color: CustomColors.grey, fontWeight: FontWeight.w400, fontSize: 13.0, fontFamily: 'Roboto'),
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