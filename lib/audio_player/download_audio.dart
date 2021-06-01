import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sembast_app/audio_player/play_downloaded_audio.dart';
class DownloadAudio extends StatefulWidget {
  @override
  _DownloadAudioState createState() => _DownloadAudioState();
}

class _DownloadAudioState extends State<DownloadAudio> {
  String audioFileName;
  int progress = 0;


  ReceivePort _receivePort = ReceivePort();

  static downloadingCallback(id, status, progress) {
    ///Looking up for a send port
    SendPort sendPort = IsolateNameServer.lookupPortByName("downloading");

    ///ssending the data
    sendPort.send([id, status, progress]);
  }
  @override
  void initState() {
    ///register a send port for the other isolates
    IsolateNameServer.registerPortWithName(_receivePort.sendPort, "downloading");


    ///Listening for the data is comming other isolataes
    _receivePort.listen((message) {
      setState(() {
        progress = message[2];
      });
      if(progress==100){
        Fluttertoast.showToast(
            msg:'File Downloaded',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.blue,
            textColor: Colors.white
        );
      }
    });
    FlutterDownloader.registerCallback(downloadingCallback);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Download Audio File'),
        centerTitle: true,
      ),
      floatingActionButton:FloatingActionButton.extended(
        onPressed:(){
          if(audioFileName!=null){
            Navigator.push(context,MaterialPageRoute(builder:(context)=>PlayAudio(fileName:audioFileName,)));
          }
          else{
            Fluttertoast.showToast(
                msg:'Download the file first!!',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.blue,
                textColor: Colors.white
            );
          }
        },
        label:Text('Open File'),
        icon:Icon(Icons.folder_open),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20,10,20,0),
          child: Column(
            // mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment:MainAxisAlignment.start,
                children: [
                  Text('Faded',style:TextStyle(fontSize:35,fontWeight:FontWeight.bold),),
                ],
              ),
              SizedBox(height:5.0),
              Row(
                mainAxisAlignment:MainAxisAlignment.start,
                children: [
                  Text('Alan Walker',style:TextStyle(fontSize:25,),),
                ],
              ),
              SizedBox(height:30,),
              Container(
                child:Image.asset('assets/fadedimage.jpg'),
              ),
              SizedBox(height:40),
              Text('Click the Below button to Download the Audio File:-'),
              SizedBox(height:10,),
              RaisedButton(
                color:Colors.blue,
                onPressed:()async{
                  var downloadStatus=await Permission.storage.status;
                  print(downloadStatus);
                  if (!downloadStatus.isGranted) {
                    await Permission.storage.request();
                  }
                  if (await downloadStatus.isGranted) {
                    showAlertDialog(context);
                  }
                },
                child:Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Text('Download MP3 FILE',style:TextStyle(color:Colors.white),),
                    Icon(Icons.download_outlined,color:Colors.white)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  showAlertDialog(BuildContext context) {

    Widget continueButton = FlatButton(
      child: Text("Download"),
      onPressed:  () async{
        final externalDirectory= await getExternalStorageDirectory();
        final id = await FlutterDownloader.enqueue(
          url:'https://paglasongs.com/files/download/type/192/id/1716',
          savedDir:externalDirectory.path,
          fileName:audioFileName,
          showNotification:true,
          openFileFromNotification:true,
        );
        print('mohit hello ${id}');
        Navigator.pop(context);
      },
    );

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Download File"),
      content: Container(
        height:100,
        child: Column(
          children: [
            Text("Enter a FileName for the file to be downloaded"),
            SizedBox(height:5.0,),
            TextField(
              onChanged:(val){
                setState(() {
                  audioFileName=val;
                });
              } ,
            )
          ],
        ),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
