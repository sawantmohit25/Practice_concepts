import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sembast_app/app_localizations.dart';
import 'package:sembast_app/coach_mark/coach_mark_impl.dart';
import 'package:sembast_app/firebase_model/user_model.dart';
import 'package:sembast_app/firebase_push_notifications/firebase_push_notification.dart';
import 'package:sembast_app/firebase_screens/Wrapper.dart';
import 'package:sembast_app/firebase_service/authentication.dart';
import 'package:sembast_app/flutter_widgets/widgets_main.dart';
import 'package:sembast_app/getX/views/employee_list_view.dart';
import 'package:sembast_app/getX/views/getx_route_view.dart';
import 'package:sembast_app/l10n.dart';
import 'package:sembast_app/live_location/live_location.dart';
import 'package:sembast_app/local_notifications/local_notification.dart';
import 'package:sembast_app/locale_provider.dart';
import 'package:sembast_app/localization/localization.dart';
import 'package:sembast_app/mvvm_implementation/employee_list.dart';
import 'package:sembast_app/mvvm_implementation/employee_viewmodel.dart';
import 'package:sembast_app/permission_screen.dart';
import 'package:sembast_app/platform_specific/platform_specific.dart';
import 'package:sembast_app/provider/provider_api_response.dart';
import 'package:sembast_app/provider/provider_userlist.dart';
import 'package:sembast_app/responsive_demo.dart';
import 'package:sembast_app/scoped_model/scoped_employee_details.dart';
import 'package:sembast_app/scoped_model/scoped_employee_list.dart';
import 'package:sembast_app/sensors/sensors.dart';
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
    //     ChangeNotifierProvider<EmployeeListViewModel>.value(
    //       // create: (context) => EmployeeListViewModel(),
    //       value:EmployeeListViewModel(),
    //     )
    //   ],child:MaterialApp(
    //   builder: DevicePreview.appBuilder,
    //   home:EmployeeList(),
    //   debugShowCheckedModeBanner: false,
    // ),);

    // return ChangeNotifierProvider(
    //         create: (context) => LocaleProvider(),
    // builder:(context,child){
    //           final provider=Provider.of<LocaleProvider>(context);
    //           return MaterialApp(
    //             locale:provider.locale,
    //             supportedLocales:L10n.all,
    //             localizationsDelegates: [
    //               // THIS CLASS WILL BE ADDED LATER
    //               // A class which loads the translations from JSON files
    //               AppLocalizations.delegate,
    //               // Built-in localization of basic text for Material widgets
    //               GlobalMaterialLocalizations.delegate,
    //               // Built-in localization for text direction LTR/RTL
    //               GlobalWidgetsLocalizations.delegate,
    //
    //             ],
    //             localeResolutionCallback: (locale, supportedLocales) {
    //               // Check if the current device locale is supported
    //               for (var supportedLocale in supportedLocales) {
    //                 if (supportedLocale.languageCode == locale.languageCode &&
    //                     supportedLocale.countryCode == locale.countryCode) {
    //                   return supportedLocale;
    //                 }
    //               }
    //               // If the locale of the device is not supported, use the first one
    //               // from the list (English, in this case).
    //               return supportedLocales.first;
    //             },
    //             home:Localization(),
    //           );
    // },
    // );


    return MaterialApp(
      builder:DevicePreview.appBuilder,
      home:CoachMarkScreen(),
      debugShowCheckedModeBanner: false,
    );


    // return StreamProvider<User>.value(value:AuthenticationService().user,
    //   child: MaterialApp(
    //     builder: DevicePreview.appBuilder, // Add the builder here
    //     home:StudentsScreen(),
    //     debugShowCheckedModeBanner: false,
    //   ),
    // );

    // void main() => runApp(
  // DevicePreview(
  //   builder: (context) => MyApp(), // Wrap your app
  // ),
// );
  }
}
