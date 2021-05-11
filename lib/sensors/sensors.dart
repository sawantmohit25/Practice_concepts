import 'package:flutter/material.dart';
import 'package:sembast_app/barcode_qr_scan/qr_create.dart';
import 'package:sembast_app/barcode_qr_scan/qr_scan_page.dart';
import 'package:sensors/sensors.dart';
class SensorData extends StatefulWidget {
  @override
  _SensorDataState createState() => _SensorDataState();
}

class _SensorDataState extends State<SensorData> {
  double x,y,z;
  double a,b,c;
  @override
  void initState() {
    gyroscopeEvents.listen((event) {
      setState(() {
        a=event.x;
        b=event.y;
        c=event.z;
      });
    });
    accelerometerEvents.listen((event) {
      setState(() {
        x=event.x;
        y=event.y;
        z=event.z;
      });
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor:Colors.pink,
        onPressed:(){
          Navigator.push(context,MaterialPageRoute(builder:(context)=>QrChoose()));
        },
        child:Icon(Icons.qr_code_scanner),
      ),
      appBar:AppBar(backgroundColor:Colors.pink[800],title:Text('Sensors Implementation'),
      centerTitle: true,),
      body:Container(
        decoration:BoxDecoration(
          gradient:LinearGradient(
            colors: [
              Colors.pink[200],
              Colors.pink[800]
            ],
            begin:Alignment.centerLeft,
            end: Alignment.centerRight,
          )
        ),
        child:Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text(
                "Gyroscope Sensor Implementation",
                style: TextStyle(color:Colors.white,fontSize: 18.0, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 40,),
              Table(
                border:TableBorder.all(
                    color:Colors.white,
                    width: 2.0,
                    style:BorderStyle.solid
                ),
                children: [
                  TableRow(
                      children:[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "Axis",
                              style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white,fontSize: 20.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:Center(
                            child: Text(
                              "Values",
                              style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white,fontSize: 20.0),
                            ),
                          ),
                        ),
                      ]
                  ),
                  TableRow(
                      children:[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "X Axis : ",
                            style: TextStyle(color: Colors.white,fontSize: 20.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(a!=null?a.toStringAsFixed(2):'',style:TextStyle(color: Colors.white),),
                        ),
                      ]
                  ),
                  TableRow(
                      children:[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Y Axis : ",
                            style: TextStyle(fontSize: 20.0,color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(b!=null?b.toStringAsFixed(2):'',style:TextStyle(color: Colors.white),),
                        ),
                      ]
                  ),
                  TableRow(
                      children:[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Z Axis : ",
                            style: TextStyle(fontSize: 20.0,color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(c!=null?c.toStringAsFixed(2):'',style:TextStyle(color: Colors.white),),
                        ),
                      ]
                  )
                ],
              ),
              SizedBox(height: 80,),
              Text(
                "Accelorometer Sensor Implementation",
                style: TextStyle(color:Colors.white,fontSize: 18.0, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 40,),
              Table(
                border:TableBorder.all(
                  color:Colors.white,
                  width: 2.0,
                  style:BorderStyle.solid
                ),
                children: [
                  TableRow(
                      children:[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "Axis",
                              style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white,fontSize: 20.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:Center(
                            child: Text(
                              "Values",
                              style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white,fontSize: 20.0),
                            ),
                          ),
                        ),
                      ]
                  ),
                  TableRow(
                    children:[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "X Axis : ",
                          style: TextStyle(color: Colors.white,fontSize: 20.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(x!=null?x.toStringAsFixed(2):'',style:TextStyle(color: Colors.white),),
                      ),
                    ]
                  ),
                  TableRow(
                      children:[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Y Axis : ",
                            style: TextStyle(fontSize: 20.0,color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(y!=null?y.toStringAsFixed(2):'',style:TextStyle(color: Colors.white),),
                        ),
                      ]
                  ),
                  TableRow(
                      children:[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Z Axis : ",
                            style: TextStyle(fontSize: 20.0,color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(z!=null?z.toStringAsFixed(2):'',style:TextStyle(color: Colors.white),),
                        ),
                      ]
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
