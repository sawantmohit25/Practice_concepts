import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sembast_app/firebase_model/user_model.dart';
import 'package:sembast_app/firebase_screens/authenticate.dart';
import 'package:sembast_app/firebase_screens/home_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<User>(context);
    print(user);
    if(user==null){
      return Authenticate();
    }
    else{
      return HomeScreen();
    }
  }
}
