import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
class LiveLocation extends StatefulWidget {
  @override
  _LiveLocationState createState() => _LiveLocationState();
}

class _LiveLocationState extends State<LiveLocation> {
  StreamSubscription _localSubscription;
  static final CameraPosition initialLocation=CameraPosition(target:LatLng(18.922064,72.834641),zoom:14.4746);
  GoogleMapController _controller;
  Location _locationTracker=Location();
  Marker marker;
  Circle circle;

  void getCurrentLocation() async{
    try{
      Uint8List imageData=await getMarker();
      var location=await _locationTracker.getLocation();
      updateMarkerAndCircle(location,imageData);
      if(_localSubscription!=null){
        _localSubscription.cancel();
      }
      _localSubscription=_locationTracker.onLocationChanged.listen((newLocData) {
        if(_controller!=null){
          _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(bearing:192.83,zoom:18.0,tilt:0,target:LatLng(newLocData.latitude,newLocData.longitude))));
          updateMarkerAndCircle(newLocData, imageData);
        }
      });
    } on PlatformException catch(e){
      if(e.code=="PERMISSION_DENIED"){
        debugPrint('Permission Denied');
      }
    }
  }

  Future<Uint8List>getMarker()async{
    ByteData  byteData=await DefaultAssetBundle.of(context).load('assets/car_icon.png');
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircle(LocationData newLocData, Uint8List imageData) {
    LatLng latLng =LatLng(newLocData.latitude,newLocData.longitude);
    this.setState(() {
      marker=Marker(
        markerId:MarkerId('home'),
        position:latLng,
        rotation:newLocData.heading,
        draggable:false,
        zIndex:2,
        flat:true,
        anchor:Offset(0.5,0.5),
        icon:BitmapDescriptor.fromBytes(imageData),
      );
      circle=Circle(
        circleId:CircleId('marker'),
        radius:newLocData.accuracy,
        zIndex: 1,
        strokeColor:Colors.blue,
        center:latLng,
        fillColor:Colors.blue.withAlpha(70),
      );
    });
  }

@override
  void dispose() {
  if(_localSubscription!=null){
    _localSubscription.cancel();
  }
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Maps Live Location'),
      ),
      floatingActionButton:Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed:getCurrentLocation,
            child:Icon(Icons.location_searching),
          ),
        ],
      ),
      body:GoogleMap(
        initialCameraPosition:initialLocation,
        mapType: MapType.hybrid,
        markers:Set.of((marker!=null)?[marker]:[]),
        circles: Set.of((circle!=null)?[circle]:[]),
        onMapCreated:(GoogleMapController controller){
          _controller=controller;
        },
      ),
    );
  }



}
