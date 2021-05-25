import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sembast_app/getX/views/employee_list_view.dart';
class RouteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Route Management'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('GetX Route Implementation',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ],
          ),
          RaisedButton(onPressed: (){
            Get.to(EmployeeListView());
          },child:Text('Next'),color:Colors.amber,),
        ],
      ),
    );
  }
}
