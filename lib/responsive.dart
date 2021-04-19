import 'package:flutter/material.dart';
class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  Responsive({@required this.mobile,@ required this.tablet});

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width>=800 && MediaQuery.of(context).size.width<=1200;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width<800;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints){
        if(constraints.maxWidth>=800){
          return tablet;
        }
        else{
          return mobile;
        }
      },
    );
  }
}
