
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

IconData stringToIcon(String icon){
  switch(icon){
    case 'atom':
      return FontAwesomeIcons.atom;
    case 'book':
      return FontAwesomeIcons.book;
    case 'calculator':
      return FontAwesomeIcons.calculator;
    case 'chess-rook':
      return FontAwesomeIcons.chessRook;
    case 'copyright':
      return FontAwesomeIcons.copyright;
    case 'desktop':
      return FontAwesomeIcons.desktop;
    case 'dna':
      return FontAwesomeIcons.dna;
    case 'film':
      return FontAwesomeIcons.film;
    case 'gamepad':
      return FontAwesomeIcons.gamepad;
    case 'globe':
      return FontAwesomeIcons.globe;
    case 'globe-africa':
      return FontAwesomeIcons.globeAfrica;
    case 'globe-americas':
      return FontAwesomeIcons.globeAmericas;
    case 'globe-asia':
      return FontAwesomeIcons.globeAsia;
    case 'globe-europe':
      return FontAwesomeIcons.globeEurope;
    case 'hat-wizard':
      return FontAwesomeIcons.hatWizard;
    case 'language':
      return FontAwesomeIcons.language;
    case 'meteor':
      return FontAwesomeIcons.meteor;
    case 'money-bill':
      return FontAwesomeIcons.moneyBill;
    case 'mountain':
      return FontAwesomeIcons.mountain;
    case 'music':
      return FontAwesomeIcons.music;
    case 'theater-masks':
      return FontAwesomeIcons.theaterMasks;
    case 'utensils':
      return FontAwesomeIcons.utensils;
    case 'vial':
      return FontAwesomeIcons.vial;
    case 'video':
      return FontAwesomeIcons.video;
  }
  print('Icon not found: ' + icon);
  return FontAwesomeIcons.crown; // By default
}