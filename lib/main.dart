import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sembast_app/provider/provider_api_response.dart';
import 'package:sembast_app/provider/provider_userlist.dart';
import 'package:sembast_app/studentsscreen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderResponse(),
      child: MaterialApp(
        home:StudentsScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
