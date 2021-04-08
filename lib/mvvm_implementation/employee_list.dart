import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sembast_app/mvvm_implementation/employee_viewmodel.dart';
class EmployeeList extends StatefulWidget {
  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  @override
  void initState() {
   Provider.of<EmployeeListViewModel>(context,listen: false).fetchUsers();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.amberAccent,
      appBar: AppBar(
        title: Text('MVVM implemetation'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body:Container(
        child: Consumer<EmployeeListViewModel>(builder: (context,data,child){
          if(data.employeeList.isNotEmpty){
            return ListView.builder(itemCount:data.employeeList.length,itemBuilder:(context,index){
              return Card(
                color:Colors.amberAccent,
                child: ListTile(
                  leading:CircleAvatar(backgroundColor: Colors.amberAccent,child:Image.network(data.employeeList[index].avatar),),
                  title: Row(
                    children: [
                      Text(data.employeeList[index].firstName),
                      SizedBox(width: 5.0,),
                      Text(data.employeeList[index].lastName),
                    ],
                  ),
                  subtitle: Text(data.employeeList[index].email),
                ),
              );
            });
          }
          else{
            return Center(child:CircularProgressIndicator(backgroundColor: Colors.white,),);
          }
        }),
      ),
    );
  }
}
