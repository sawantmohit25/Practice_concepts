import 'package:flutter/material.dart';
import 'package:sembast_app/l10n.dart';
class LocaleProvider extends ChangeNotifier{
  Locale _locale;

  Locale get locale => _locale;

  void setLocale(Locale locale){
    if(!L10n.all.contains(locale)) return;
    _locale=locale;
    notifyListeners();
  }
  clearLocale(){
    _locale=null;
    notifyListeners();
  }
}