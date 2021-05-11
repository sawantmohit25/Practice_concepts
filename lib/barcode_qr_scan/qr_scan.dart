import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
class QrScan extends StatefulWidget {
  @override
  _QrScanState createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  String qrResult='Qr Scanned Value';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      appBar:AppBar(
        backgroundColor:Colors.cyan,
        title: Text('QR Code Scanner'),
      ),
      body:Center(
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Text(
              'Scan Result',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(qrResult==-1?qrResult:'None Items Scanned',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 72),
            RaisedButton(
              color:Colors.cyan,
              child:Text('Start QR scan'),
              onPressed: () => scanQRCode(),
            ),

          ],
        ),
      ),
    );
  }

  Future<void> scanQRCode() async{
    String qrCode;
    try{
       qrCode=await FlutterBarcodeScanner.scanBarcode('#00ffff','Cancel',false,ScanMode.QR);
       if (!mounted) return;

       setState(() {
         this.qrResult = qrCode;
       });

    }on PlatformException {
      qrResult = 'Failed to get platform version.';
    }
  }
}
