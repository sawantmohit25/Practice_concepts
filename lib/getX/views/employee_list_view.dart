import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:sembast_app/getX/controllers/employee_controller.dart';
class EmployeeListView extends StatelessWidget {

  final EmployeeController employeeController=Get.put(EmployeeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX implemetation'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body:Column(
        children: [
          Text('Employee Details',style:TextStyle(fontSize: 40,fontWeight: FontWeight.bold,decoration:TextDecoration.underline),),
          SizedBox(height:20.0),
          Obx((){
            if(employeeController.isLoading.value){
              return CircularProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.amber),
              );
            }
            else{
              return ListView.builder(shrinkWrap: true,itemCount:employeeController.employeeList.length,itemBuilder:(context,index){
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 10.0,
                  color:Colors.amberAccent,
                  child: ListTile(
                    // onTap: (){
                    //   Navigator.push(context, MaterialPageRoute(builder:(context) => EmployeeDetails(firstName:element.firstName,lastName:element.lastName,email:element.email,avatar:element.avatar,)));
                    // },
                    leading:CircleAvatar(backgroundColor:Colors.amberAccent,child:Image.network(employeeController.employeeList[index].avatar),),
                    title: Row(
                      children: [
                        Text(employeeController.employeeList[index].firstName),
                        SizedBox(width: 5.0,),
                        Text(employeeController.employeeList[index].lastName),
                      ],
                    ),
                    subtitle: Text(employeeController.employeeList[index].email),
                  ),
                );
              });
            }}),
        ],
      ),
    );
  }
}
