import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
class FirebaseNotification extends StatefulWidget {
  @override
  _FirebaseNotificationState createState() => _FirebaseNotificationState();
}

class _FirebaseNotificationState extends State<FirebaseNotification> {
  String title="Title",description="Message";
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  @override
  void initState() {
    _firebaseMessaging.configure(
      onMessage: (message)async{
        setState(() {
          title=message["notification"]["title"];
          description= "You have recieved a new notification";
        });
      },
      onResume: (message)async{
        setState(() {
          title=message["data"]["title"];
          description= "You have opened app through notification";
        });
      },
      onLaunch:(message)async{
      setState(() {
        title=message["data"]["title"];
        description= "You have Launched app through notification";
      });
    }
    );
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Firebase Push Notification'),
        backgroundColor:Colors.indigo,
      ),
      body:Container(
        decoration:BoxDecoration(
          gradient:LinearGradient(
            begin:Alignment.topLeft,
            end: Alignment.bottomRight,
            colors:[
              Colors.indigo[200],
              Colors.indigo[800],
            ]
          )
        ),
        child:Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,style:TextStyle(fontSize:30,color:Colors.white,fontWeight:FontWeight.bold),),
            SizedBox(height:10.0,),
            Text(description,style:TextStyle(fontSize:15,color:Colors.white,fontWeight:FontWeight.bold),),
          ],
        )),
      ),
    );
  }
}
