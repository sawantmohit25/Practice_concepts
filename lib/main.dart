import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sembast_app/mvvm_implementation/employee_list.dart';
import 'package:sembast_app/mvvm_implementation/employee_viewmodel.dart';
import 'package:sembast_app/provider/provider_api_response.dart';
import 'package:sembast_app/provider/provider_userlist.dart';
import 'package:sembast_app/scoped_model/scoped_employee_details.dart';
import 'package:sembast_app/scoped_model/scoped_employee_list.dart';
import 'package:sembast_app/studentsscreen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  final ScopedDetails scopedDetails=ScopedDetails();
  @override
  Widget build(BuildContext context) {
    // return ScopedModel<ScopedDetails>(model:scopedDetails, child:MaterialApp(
    //   home: EmployeeDetails(),
    //   debugShowCheckedModeBanner: false,
    // ));
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
