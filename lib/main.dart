import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sembast_app/firebase_model/user_model.dart';
import 'package:sembast_app/firebase_screens/Wrapper.dart';
import 'package:sembast_app/firebase_service/authentication.dart';
import 'package:sembast_app/mvvm_implementation/employee_list.dart';
import 'package:sembast_app/mvvm_implementation/employee_viewmodel.dart';
import 'package:sembast_app/permission_screen.dart';
import 'package:sembast_app/provider/provider_api_response.dart';
import 'package:sembast_app/provider/provider_userlist.dart';
import 'package:sembast_app/responsive_demo.dart';
import 'package:sembast_app/scoped_model/scoped_employee_details.dart';
import 'package:sembast_app/scoped_model/scoped_employee_list.dart';
import 'package:sembast_app/studentsscreen.dart';

void main() {
  runApp(  DevicePreview(
    enabled: false,
    builder: (context) => MyApp(), // Wrap your app
  ),);
}
class MyApp extends StatelessWidget {
  // final ScopedDetails scopedDetails=ScopedDetails();
  @override
  Widget build(BuildContext context) {
    // return ScopedModel<ScopedDetails>(model:scopedDetails, child:MaterialApp(
    //   home: EmployeeDetails(),
    //   debugShowCheckedModeBanner: false,
    // ));
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider<ProviderResponse>(
    //       create: (context) => ProviderResponse(),
    //     ),
    //     ChangeNotifierProvider<EmployeeListViewModel>(
    //       create: (context) => EmployeeListViewModel(),
    //     )
    //   ],
    return StreamProvider<User>.value(value:AuthenticationService().user,
      child: MaterialApp(
        builder: DevicePreview.appBuilder, // Add the builder here
        home:Wrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
    // void main() => runApp(
  // DevicePreview(
  //   builder: (context) => MyApp(), // Wrap your app
  // ),
// );
  }
}
