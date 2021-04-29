import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class PlatformSpecific extends StatefulWidget {
  @override
  _PlatformSpecificState createState() => _PlatformSpecificState();
}

class _PlatformSpecificState extends State<PlatformSpecific> {
  String _batteryLevel = '';
  double _opacity=0;

  static const batteryChannel=const MethodChannel('battery');
  int _battery=0;

  Future<void> _getBatteryInformation()async{
    String batteryLevel;
    int battery;
    try {
      final int result = await batteryChannel.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
      battery=result;
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _battery=battery;
      _batteryLevel = batteryLevel;
      _opacity=1;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      appBar:AppBar(
        backgroundColor:Colors.green,
        title: Text('Platform Specific Implementation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            batteryContainer(_battery),
            SizedBox(height: 20.0),
            AnimatedOpacity(duration:Duration(seconds:3),opacity:_opacity,child: Text(_batteryLevel,style: TextStyle(color:Colors.white,fontSize: 20),)),
            SizedBox(height: 20.0),
            RaisedButton(color: Colors.green,onPressed:_getBatteryInformation,child: Text('Click',),),
          ],
        ),
      ),
    );
  }
  Widget batteryContainer(int battery){
    if(battery==100){
      return Column(
        children: [
          Icon(Icons.battery_full,size: 300,color: Colors.green[900],),
          Text('Full!!',style: TextStyle(color: Colors.green[900],fontSize: 25),)
        ],
      );
    }
    else if(battery>=50 || battery<=99 ){
      return Column(
        children: [
          Icon(Icons.battery_charging_full,size: 300,color: Colors.green,),
          Text('No Charging Needed',style: TextStyle(color: Colors.green,fontSize: 25),)
        ],
      );
    }
    else if(battery>=10 || battery<=50 ){
      return Column(
        children: [
          Icon(Icons.battery_charging_full,size: 300,color: Colors.orange,),
          Text('Charging Needed',style: TextStyle(color: Colors.orange,fontSize: 25),)
        ],
      );
    }
    else{
      return Column(
        children: [
          Icon(Icons.battery_alert,size: 300,color: Colors.red,),
          Text('Battery Low!!',style: TextStyle(color: Colors.red,fontSize: 25),)
        ],
      );
    }
  }
}
