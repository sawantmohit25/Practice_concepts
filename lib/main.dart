import 'package:flutter/material.dart';
import 'package:sembast_app/studentsscreen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:StudentsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
