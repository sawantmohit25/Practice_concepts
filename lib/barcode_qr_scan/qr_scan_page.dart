import 'package:flutter/material.dart';
import 'package:sembast_app/barcode_qr_scan/qr_create.dart';
import 'package:sembast_app/barcode_qr_scan/qr_scan.dart';
class QrChoose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      appBar:AppBar(
        backgroundColor:Colors.cyan,
        title: Text('QR Code Scanner'),
      ),
      body:Center(
        child:Row(
          mainAxisAlignment:MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              color: Colors.cyan,
              child:Text('QR Create'),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder:(context)=>QrCreate()));

              },
            ),
            RaisedButton(
              color: Colors.cyan,
              child:Text('QR Scan'),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder:(context)=>QrScan()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
