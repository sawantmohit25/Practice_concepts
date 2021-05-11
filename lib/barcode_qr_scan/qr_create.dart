import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class QrCreate extends StatefulWidget {
  @override
  _QrCreateState createState() => _QrCreateState();
}

class _QrCreateState extends State<QrCreate> {
  TextEditingController qrValue =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:AppBar(
        backgroundColor:Colors.cyan,
        title: Text('QR Code Scanner'),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child:Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(60.0,60,60,20),
                  child: BarcodeWidget(
                    barcode:Barcode.qrCode(),
                    color:Colors.white,
                    data:qrValue.text??'default',
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(height: 40),
                TextField(
                  style:TextStyle(color: Colors.white),
                  decoration:InputDecoration(
                    hintText: 'Enter the data',
                    hintStyle: TextStyle(color: Colors.white),
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        )
                  ),
                ),
                  controller:qrValue,
                ),
                SizedBox(height: 20),
                RaisedButton(color:Colors.cyan,onPressed:(){
                  setState(() {
                    Fluttertoast.showToast(
                        msg:'Qr Code Created Successfully',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.cyan,
                        textColor: Colors.white
                    );
                  });
                },child:Text('Create Qr Code'),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
