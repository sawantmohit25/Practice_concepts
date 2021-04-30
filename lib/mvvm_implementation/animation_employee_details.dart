import 'package:flutter/material.dart';
class EmployeeDetails extends StatelessWidget {
  String firstName,lastName,email,avatar;
  EmployeeDetails({this.firstName,this.lastName,this.email,this.avatar});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Employee Details'),
        backgroundColor: Colors.amber,
      ),
      body:Container(
        child: Column(
          children: [
            Container(width: double.infinity,child: Hero(tag: 'image-${firstName}',child: Image.network(avatar,height:300,alignment:Alignment.topCenter,fit:BoxFit.cover,))),
            SizedBox(height:20),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0,0,10,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('${firstName} ${lastName}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0,0,10,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Email - ${email}',style: TextStyle(fontWeight: FontWeight.bold,fontSize:18),),
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}
