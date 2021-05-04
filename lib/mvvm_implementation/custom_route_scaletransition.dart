import 'package:flutter/cupertino.dart';

class CustomScaleRoute extends PageRouteBuilder{
  final Widget widget;
  CustomScaleRoute({this.widget}):super(
      transitionDuration:Duration(seconds:1),
      pageBuilder:(context,animation,secondaryAnimation)
      {return widget;},
      transitionsBuilder:(context,animation,secondaryAnimation,child){
        animation=CurvedAnimation(parent:animation,curve:Curves.easeInOut);
        return ScaleTransition(scale: animation,child:child,alignment:Alignment.center,);
      });
}