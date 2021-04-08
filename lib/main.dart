import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sembast_app/mvvm_implementation/employee_list.dart';
import 'package:sembast_app/mvvm_implementation/employee_viewmodel.dart';
import 'package:sembast_app/provider/provider_api_response.dart';
import 'package:sembast_app/provider/provider_userlist.dart';
import 'package:sembast_app/studentsscreen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderResponse>(
          create: (context) => ProviderResponse(),
        ),
        ChangeNotifierProvider<EmployeeListViewModel>(
          create: (context) => EmployeeListViewModel(),
        )
      ],
      child: MaterialApp(
        home:StudentsScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
