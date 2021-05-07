import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sembast_app/l10n.dart';
import 'package:sembast_app/locale_provider.dart';
class LanguagePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<LocaleProvider>(context,listen: false);

    final locale=provider.locale;

    return DropdownButtonHideUnderline(child:DropdownButton(
      iconEnabledColor: Colors.white,
      hint:Text('Language A/क',style:TextStyle(fontSize:20,color:Colors.white),),
      dropdownColor:Colors.teal,
      onChanged: (_){},
      value: locale,
      items:L10n.all.map((locale){
        final language=L10n.getLanguage(locale.languageCode);
        return DropdownMenuItem(
          onTap:(){
            final provider=Provider.of<LocaleProvider>(context,listen: false);
            provider.setLocale(locale);
          },
            value:locale,
            child:Center(
          child:Text(language,style:TextStyle(fontSize:20,color:Colors.white),),
        ));
      }).toList(),
    ));
  }
}
