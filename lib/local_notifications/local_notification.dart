import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

//Changes need to be done in AndroidManifest.xml prior to this code implementation.

class LocalNotification extends StatefulWidget {
  @override
  _LocalNotificationState createState() => _LocalNotificationState();
}

class _LocalNotificationState extends State<LocalNotification> {
  String selectedParam;
  int _val;
  String task;
  FlutterLocalNotificationsPlugin flutterNotification;

  @override
  void initState() {
    tz.initializeTimeZones();
    var androidInitialize=AndroidInitializationSettings('splashscreensembast');
    var iosInitialize=IOSInitializationSettings();
    var initializationSettings=InitializationSettings(android:androidInitialize,iOS: iosInitialize);
    flutterNotification=FlutterLocalNotificationsPlugin();
    flutterNotification.initialize(initializationSettings,onSelectNotification:notificationSelected);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Local Notification'),
      ),
      backgroundColor:Colors.blue[200],
      body:SingleChildScrollView(
        child: Container(
          child:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  color:Colors.blue,
                  onPressed:showNotification,
                  child: Text('Basic Notifications'),
                ),
                RaisedButton(
                  color:Colors.blue,
                  onPressed:stylishNotification,
                  child: Text('Styled Notifications'),
                ),
                RaisedButton(
                  color:Colors.blue,
                  onPressed:imageNotification,
                  child: Text('Image Notifications'),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextField(
                    decoration: InputDecoration(hintText:'Add Notification Description',border:OutlineInputBorder()),
                    onChanged:(val){
                      setState(() {
                        task=val;
                      });
                    },
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color:Colors.blue,
                      child: DropdownButton(underline:SizedBox(),dropdownColor:Colors.white,value:selectedParam,items:[
                        DropdownMenuItem(child:Text('Seconds',style:TextStyle(color:Colors.black),),value: 'Seconds',),
                        DropdownMenuItem(child:Text('Minutes',style:TextStyle(color:Colors.black),),value: 'Minutes',),
                        DropdownMenuItem(child:Text('Hour',style:TextStyle(color:Colors.black),),value: 'Hour',)

                      ], onChanged:(val){
                        setState(() {
                          selectedParam=val;
                        });
                      },hint:Text('Select Your Field'),style:TextStyle(fontWeight:FontWeight.bold),),
                    ),
                    Container(
                      color:Colors.blue,
                      child: DropdownButton<int>(underline:SizedBox(),hint:Text('Select a Value'),value:_val,items:[
                        DropdownMenuItem<int>(child:Text('1'),value: 1,),
                        DropdownMenuItem<int>(child:Text('2'),value: 2,),
                        DropdownMenuItem<int>(child:Text('3'),value: 3,),
                        DropdownMenuItem<int>(child:Text('4'),value: 4,),
                        DropdownMenuItem<int>(child:Text('5'),value: 5,),
                      ], onChanged:(val){
                        setState(() {
                          _val=val;
                        });
                      }),
                    )
                  ],
                ),
                SizedBox(height: 10),
                RaisedButton(
                  color:Colors.blue,
                  onPressed:scheduleNotification,
                  child: Text('Get Scheduled Notifications'),
                ),
                SizedBox(height: 10),
                RaisedButton(
                  color:Colors.blue,
                  onPressed:cancelNotification,
                  child: Text('Cancel Notification'),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
  Future notificationSelected(String payload) async{
    showDialog(context:context,builder:(context)=>AlertDialog(content:Text('Demo Notification ${payload}'),));
  }

  Future showNotification() async{
    var androidDetails=AndroidNotificationDetails("id","Demo test","Testing Notifications",importance:Importance.max,priority:Priority.high);
    var iosDetails=IOSNotificationDetails();
    var notificationDetails=NotificationDetails(android:androidDetails,iOS: iosDetails);
    await flutterNotification.show(0,'Demo instant Notification','You Created a Notfication', notificationDetails,payload:"Clicked");
    Fluttertoast.showToast(
        msg:'Basic Notification Sent',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.white,
        textColor: Colors.blue
    );
  }

  Future stylishNotification() async{
    var androidDetails=AndroidNotificationDetails("id","Demo test","Testing Notifications",importance:Importance.max,priority:Priority.high,color:Colors.blue,
    enableLights:true,
      enableVibration: true,
      largeIcon:DrawableResourceAndroidBitmap("push_notification_1"),
      styleInformation:MediaStyleInformation(htmlFormatContent: true,htmlFormatTitle: true),
    );
    var iosDetails=IOSNotificationDetails();
    var notificationDetails=NotificationDetails(android:androidDetails,iOS: iosDetails);
    await flutterNotification.show(0,'Demo instant Notification','You Created a Notfication', notificationDetails,payload:"Clicked");
    Fluttertoast.showToast(
        msg:'Styled Notification Sent',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.white,
        textColor: Colors.blue
    );
  }

  Future scheduleNotification() {
    var scheduledTime;
    var androidDetails=AndroidNotificationDetails("id","Demo test","Testing Notifications",showWhen:false,importance:Importance.high,enableLights:true,
        enableVibration: true,
        largeIcon:DrawableResourceAndroidBitmap("push_notification_1"),
        styleInformation:MediaStyleInformation(htmlFormatContent: true,htmlFormatTitle: true));
    var iosDetails=IOSNotificationDetails();
    var notificationDetails=NotificationDetails(android:androidDetails,iOS: iosDetails);
    if(selectedParam=='Hour'){
      scheduledTime=tz.TZDateTime.now(tz.local).add(Duration(hours:_val));
    }
    else if(selectedParam=='Seconds'){
      scheduledTime=tz.TZDateTime.now(tz.local).add(Duration(seconds:_val));
    }
    else{
      scheduledTime=tz.TZDateTime.now(tz.local).add(Duration(minutes:_val));
    }

    flutterNotification.zonedSchedule(1,task, 'Testing Notifications', scheduledTime,notificationDetails,androidAllowWhileIdle:true,uiLocalNotificationDateInterpretation:UILocalNotificationDateInterpretation.absoluteTime);
    Fluttertoast.showToast(
        msg:'Scheduled Notification Sent',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.white,
        textColor: Colors.blue
    );
  }

  Future cancelNotification()async{
    await flutterNotification.cancelAll();
    Fluttertoast.showToast(
        msg:'Notification Canceled',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.white,
        textColor: Colors.blue
    );
  }

  Future imageNotification()async{
    var bigImage=BigPictureStyleInformation(DrawableResourceAndroidBitmap("push_notification_1"),largeIcon:DrawableResourceAndroidBitmap("push_notification_1"),contentTitle:"Demo Image Notification",summaryText:"Test Notification",htmlFormatTitle: true,htmlFormatContentTitle: true);
    var androidDetails=AndroidNotificationDetails("id","Demo test","Testing Notifications",importance:Importance.max,priority:Priority.high,styleInformation:bigImage);
    var iosDetails=IOSNotificationDetails();
    var notificationDetails=NotificationDetails(android:androidDetails,iOS: iosDetails);
    await flutterNotification.show(0,'Demo instant Notification','You Created a Notfication', notificationDetails,payload:"Clicked");
    Fluttertoast.showToast(
        msg:'Image Notification Sent',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.white,
        textColor: Colors.blue
    );
  }
}
