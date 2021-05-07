import 'package:flutter/material.dart';
class L10n{
  static final all=[
    const Locale('en','US'),
    const Locale('hi','IN'),
    const Locale('mr','IN'),
  ];
  static String getLanguage(String code){
    switch(code){
      case 'en':
        return 'English';
      case 'hi':
        return 'Hindi';
      case 'mr':
        return 'Marathi';
      default :
        return 'English';
    }
  }
}