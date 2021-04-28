// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:sembast_app/permission_screen.dart';
// class GrantPermission extends StatelessWidget {
//   final PermissionScreen permissionScreenObj =PermissionScreen();
//
//   checkpermission_opengallery()async{
//     var galleryStatus = await Permission.photos.status;
//     print(galleryStatus);
//     if(!galleryStatus.isGranted){
//       await Permission.photos.request();
//     }
//     if(await galleryStatus.isGranted){
//       permissionScreenObj.o;
//     }
//     else{
//     Fluttertoast.showToast(
//     msg:'Provide Permission to use your photos',
//     toastLength: Toast.LENGTH_SHORT,
//     gravity: ToastGravity.BOTTOM,
//     backgroundColor: Colors.blue,
//     textColor: Colors.white
//     );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
