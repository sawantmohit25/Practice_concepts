import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';


class PermissionScreen extends StatefulWidget {
  @override
  _PermissionScreenState createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {

  File _image,_camera,_storage;
  double progress=0.0;
  final _picker=ImagePicker();
  Dio dio =Dio();
  bool downloading=false;
  String progressString='';
  final imgUrl="https://images.unsplash.com/photo-1473968512647-3e447244af8f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDd8fHRlY2hub2xvZ3l8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";

  TextEditingController phoneNumber = TextEditingController();
   openCamera() async{
    PickedFile image = await ImagePicker().getImage(
        source: ImageSource.camera);
    setState(() {
      _camera= File(image.path);
    });
  }
  checkCameraPermission() async {
    var cameraStatus = await Permission.camera.status;
    print(cameraStatus);
    if (!cameraStatus.isGranted) {
      await Permission.camera.request();
    }
    if (await cameraStatus.isGranted) {
      setState(() {
        openCamera();
      });
    }
  }
  void openPhone(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  checkPhonePermission() async {
    var phoneStatus = await Permission.phone.status;
    print(phoneStatus);
    if (!phoneStatus.isGranted) {
      await Permission.phone.request();
    }
    if (await phoneStatus.isGranted) {
      setState(() {
        openPhone('tel:${phoneNumber.text}');
      });
    }
  }
  openGallery() async {
    PickedFile image = await ImagePicker().getImage(
        source: ImageSource.gallery);
    setState(() {
      _image = File(image.path);
    });
  }
  checkGalleryPermission() async {
    var galleryStatus = await Permission.photos.status;
    print(galleryStatus);
    if (!galleryStatus.isGranted) {
      await Permission.photos.request();
    }
    if (await galleryStatus.isGranted) {
      openGallery();
    }
    else {
      Fluttertoast.showToast(
          msg: 'Provide Permission to use your photos',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.blue,
          textColor: Colors.white
      );
    }
  }
  checkLocationPermission()async{
     var locationStatus=await Permission.location.status;
     print(locationStatus);
     if (!locationStatus.isGranted) {
       await Permission.location.request();
     }
     if (await locationStatus.isGranted) {
       Fluttertoast.showToast(
           msg: 'App using location',
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.BOTTOM,
           backgroundColor: Colors.blue,
           textColor: Colors.white
       );
     }
  }
  checkStoragePermission()async{
     var storageStatus=await Permission.storage.status;
     print(storageStatus);
     if (!storageStatus.isGranted) {
       await Permission.storage.request();
     }
     if ( await storageStatus.isGranted) {
       try{
         Directory dir = await saveFile();
         await dio.download(imgUrl,"${dir.path}/demo_image.jpg",onReceiveProgress:(rec,total){
           print('Rec: ${rec} and Total:${total}');
           setState(() {
             downloading=true;
             progress=rec/total;
             progressString=((rec/total)*100).toStringAsFixed(0)+"%";
           });
         }
         );
         Fluttertoast.showToast(
             msg: 'Image Downloaded',
             toastLength: Toast.LENGTH_SHORT,
             gravity: ToastGravity.BOTTOM,
             backgroundColor: Colors.blue,
             textColor: Colors.white
         );
       }
       catch(e){
         print(e);
       }
       setState(() {
         downloading=false;
         progressString='Completed';
       });
     }
     else {
       Fluttertoast.showToast(
           msg: 'Provide Permission to use your photos',
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.BOTTOM,
           backgroundColor: Colors.blue,
           textColor: Colors.white
       );
     }
  }
  Future<Directory> saveFile()async{
    var dir =await getExternalStorageDirectory();
    print(dir.path);
    String newPath="";
    List<String> folders=dir.path.split('/');
    for(int x=1;x<folders.length;x++){
      String folder=folders[x];
      if(folder!='Android'){
        newPath+='/'+folder;
      }
      else{
        break;
      }
    }
    newPath=newPath+'/DEMOapp';
    dir=Directory(newPath);
    return dir;
  }
  openStorageImage()async{
    final pickedFile = '/storage/DEMOapp/demo_image.jpg';
    final File file = File(pickedFile);
    setState(() {
      _storage = file;
    });
  }
  @override
  void initState() {
     checkLocationPermission();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Custom Permissions Implementaion'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0,20.0),
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Enter the Phone No to call',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    width: double.infinity,
                    child: TextField(controller:phoneNumber,decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blue, width: 0.0),),
                      hintText:'Enter the Phone No to Call',
                      hintStyle:TextStyle(color:Colors.blue),
                    ),),
                  ),
                  SizedBox(height: 20),
                  Center(child:Container(
                    width:100,
                    child: RaisedButton(color:Colors.blue,onPressed: checkPhonePermission,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('CALL',style: TextStyle(fontSize:10,fontWeight: FontWeight.bold),),
                          SizedBox(width: 10.0,),
                          Icon(Icons.call),
                        ],
                      ),),
                  ),),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Gallery Image',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 200.0,
                    width: 200.0,
                    child: _image != null ? Image.file(_image) :Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(iconSize:40,icon:Icon(Icons.file_upload,color: Colors.blue,), onPressed:checkGalleryPermission)
                      ],
                    )
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Click a pic from your Camera',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: InkWell(
                      onTap:checkCameraPermission,
                      child: Container(
                        height: 200.0,
                        width: 200.0,
                        child: _camera != null ? Image.file(_camera) :Icon(Icons.camera,size:40,color: Colors.blue,)
                      ,
                    )),
                  ),
                  SizedBox(height: 20.0),
                  Wrap(
                    children: [
                      Text('Click the button to download image and store it in internal storage of device',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  Center(child:downloading==true?Column(
                    children: [
                      CircularProgressIndicator(
                        value: progress,
                      ),
                      // LinearProgressIndicator(
                      //   value: progress,
                      //   minHeight: 10,
                      // ),
                      Text(progressString)
                    ],
                  ):RaisedButton(color: Colors.blue,onPressed:checkStoragePermission,child: Text('Download'), )),
                  // Container(
                  //     height: 200.0,
                  //     width: 200.0,
                  //     child: _storage != null ? Image.file(_storage) :Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         IconButton(iconSize:40,icon:Icon(Icons.file_upload,color: Colors.blue,), onPressed:openStorageImage)
                  //       ],
                  //     )
                  // ),
                ],
              ),
            ),
          ),
        )
    );
  }
  }

