import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sembast_app/mvvm_implementation/animation_employee_details.dart';
import 'package:sembast_app/mvvm_implementation/employee_viewmodel.dart';
class EmployeeList extends StatefulWidget {
  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {

  final GlobalKey<AnimatedListState> _listKey=GlobalKey<AnimatedListState>();

  Tween<Offset> _offset =Tween(begin: Offset(1,0),end: Offset(0,0));
  double _opacity=0;


  @override
  void initState() {
      Future.delayed(Duration(seconds: 3),(){
        setState(() {
          _opacity=1;
        });
      });
   Provider.of<EmployeeListViewModel>(context,listen: false).fetchUsers();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVVM implemetation'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body:Column(
        children: [
          AnimatedOpacity(duration:Duration(seconds:3),opacity:_opacity,child: Text('Employees Information',style: TextStyle(color:Colors.black,fontSize: 30),)),
          SizedBox(height: 20,),
          Container(
            child: Consumer<EmployeeListViewModel>(builder: (context,data,child){
              if(data.employeeList.isNotEmpty){
                return AnimatedList(
                  shrinkWrap: true,
                    key: _listKey,
                    initialItemCount:data.employeeList.length,
                    itemBuilder:(context,index,animation){
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10.0,
                    color:Colors.amberAccent,
                    child: SlideTransition(
                      position:animation.drive(_offset),
                      child: ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context) => EmployeeDetails(firstName:data.employeeList[index].firstName,lastName:data.employeeList[index].lastName,email:data.employeeList[index].email,avatar:data.employeeList[index].avatar,)));
                        },
                        leading:CircleAvatar(backgroundColor:Colors.amberAccent,child:Hero(tag:'image-${data.employeeList[index].firstName}',child: Image.network(data.employeeList[index].avatar,)),),
                        title: Row(
                          children: [
                            Text(data.employeeList[index].firstName),
                            SizedBox(width: 5.0,),
                            Text(data.employeeList[index].lastName),
                          ],
                        ),
                        subtitle: Text(data.employeeList[index].email),
                      ),
                    ),
                  );
                });
              }
              else{
                return Center(child:CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.yellow),
                ),);
              }
            }),
          ),
        ],
      ),
    );
  }
}
