import 'dart:ui';

import 'package:flutter/material.dart';
class RouteAnimationScreen extends StatefulWidget {
  @override
  _RouteAnimationScreenState createState() => _RouteAnimationScreenState();
}

class _RouteAnimationScreenState extends State<RouteAnimationScreen> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation<double> animation;
  @override
  void initState() {
    _controller=AnimationController(vsync: this,duration: Duration(seconds: 1));
    _controller.forward();
    animation=Tween<double>(begin: 0.0,end: 1.0).animate(_controller);
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Route'),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: Column(
          children: [
            TweenAnimationBuilder(
                duration:Duration(seconds:3),
                tween:Tween<double>(begin:0,end: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Rotation Transition',style: TextStyle(fontSize:40,fontWeight:FontWeight.bold),),
                  ],
                ),
            builder:(BuildContext context,double _val,Widget child){
                  return Opacity(
                    opacity: _val,
                    child: Padding(
                      padding:EdgeInsets.only(top: _val*30),
                      child: child,
                    ),
                  );
            },),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotationTransition(turns:animation,child:Container(width:300,child: Image.asset('assets/nature_flutter.jpeg'))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
