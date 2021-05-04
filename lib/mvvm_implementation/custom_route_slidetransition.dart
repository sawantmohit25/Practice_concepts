import 'package:flutter/cupertino.dart';

class CustomRoute extends PageRouteBuilder{
  final Widget widget;
  CustomRoute({this.widget}):super(
      transitionDuration:Duration(seconds:1),
      pageBuilder:(context,animation,secondaryAnimation)
      {return widget;},
      transitionsBuilder:(context,animation,secondaryAnimation,child){
        animation=CurvedAnimation(parent:animation,curve:Curves.easeInOut);
        return SlideTransition(position:Tween<Offset>(begin:Offset(1.0,0),end:Offset.zero).animate(animation),
          child:SlideTransition(position:Tween<Offset>(begin:Offset.zero,end:Offset(1.0,0.0)).animate(secondaryAnimation),child:child,),);
      });
}