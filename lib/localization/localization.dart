import 'package:flutter/material.dart';
import 'package:sembast_app/app_localizations.dart';
import 'package:sembast_app/live_location/live_location.dart';
import 'package:sembast_app/localization/language_picker.dart';
class Localization extends StatefulWidget {
  @override
  _LocalizationState createState() => _LocalizationState();
}

class _LocalizationState extends State<Localization> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton(
        backgroundColor:Colors.teal,
        onPressed:(){
          Navigator.push(context,MaterialPageRoute(builder:(context) => LiveLocation()));
        },
        child:Icon(Icons.chevron_right),
      ),
        appBar:AppBar(title: Text(AppLocalizations.of(context).translate('app_title')),backgroundColor:Colors.teal,actions: [
          LanguagePicker(),
          SizedBox(width: 12,)
        ],),
    body:Container(
    decoration:BoxDecoration(
    gradient:LinearGradient(
    begin:Alignment.topLeft,
    end: Alignment.bottomRight,
    colors:[
    Colors.teal[100],
    Colors.teal[800],
    ]
    )
    ),
    child:Center(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(AppLocalizations.of(context).translate('first_string'),style:TextStyle(fontSize:28,color:Colors.white,fontWeight:FontWeight.bold),),
    SizedBox(height:10.0,),
    Text(AppLocalizations.of(context).translate('second_string'),style:TextStyle(fontSize:15,color:Colors.white,fontWeight:FontWeight.bold),),
    ],
    )),
    ));
  }
}
