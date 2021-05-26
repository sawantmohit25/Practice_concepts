import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
class CoachMarkScreen extends StatefulWidget {
  @override
  _CoachMarkScreenState createState() => _CoachMarkScreenState();
}

class _CoachMarkScreenState extends State<CoachMarkScreen> {
  TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets=List();
  //All keys
  GlobalKey key=GlobalKey();
  GlobalKey key1=GlobalKey();
  GlobalKey key2=GlobalKey();
  GlobalKey key3=GlobalKey();

  @override
  void initState() {
    initTargets();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Tutorial Guide'),
        centerTitle: true,
        leading:Icon(Icons.menu),
        key:key,
      ),
      body:Center(
        child:Column(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              key: key1,
              child:Text('1',style:TextStyle(fontSize: 40),),
            ),
            Container(
              key: key2,
              child:Text('2',style:TextStyle(fontSize: 40),),
            ),
            Container(
              key:key3,
              child:Text('3',style:TextStyle(fontSize: 40),),
            )
          ],
        ),
      ),
    );
  }

  void initTargets() {
    targets.add(TargetFocus(
      identify: 'Target 0',
      keyTarget:key,
      contents: [
        TargetContent(child:Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Titulo lorem ipsum",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20.0),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),),
      ],
    ));

    targets.add(
      TargetFocus(
        identify: "Target 1",
        keyTarget: key1,
        color: Colors.red,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Titulo lorem ipsum",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
        shape: ShapeLightFocus.RRect,
        radius: 5,
      ),
    );

    targets.add(TargetFocus(
      identify: "Target 2",
      keyTarget:key2,
      contents: [
        TargetContent(
            align: ContentAlign.top,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      "Multiples contents",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )),
        TargetContent(
            align: ContentAlign.bottom,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    "Multiples contents",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
                Container(
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ))
      ],
      shape: ShapeLightFocus.Circle,
    ));

    targets.add(TargetFocus(
      identify: "Target 3",
      keyTarget:key3,
      color: Colors.amber,
      contents: [
        TargetContent(
            align: ContentAlign.top,
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.network(
                      "https://www.concorsopiovedisacco.com/wp-content/uploads/2021/01/videotutorial-logo.jpg",fit: BoxFit.contain,
                      height: 120,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      "Image Load network",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ))
      ],
      shape: ShapeLightFocus.RRect,
    ));
  }

  void _afterLayout(_) {
    Future.delayed(Duration(seconds:1));
    showTutorial();
  }

  void showTutorial() {
    tutorialCoachMark=TutorialCoachMark(context,
      targets:targets,
      colorShadow:Colors.blue,
      textSkip:"SKIP",
      opacityShadow: 0.8,
      onSkip:(){
        Fluttertoast.showToast(
            msg:'You have Skipped the Tutorial guide for this Application',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.blue,
            textColor: Colors.white
        );
      },
      onFinish: (){
        Fluttertoast.showToast(
            msg:'You have Finished the Tutorial guide for this Application',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.blue,
            textColor: Colors.white
        );
      }
    )..show();
  }
}
