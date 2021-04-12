import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sembast_app/scoped_model/scoped_employee_details.dart';
class EmployeeDetails extends StatefulWidget {
  @override
  _EmployeeDetailsState createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends State<EmployeeDetails> {
  final ScopedDetails scopedDetails=ScopedDetails();
  @override
  void initState() {
    scopedDetails.getData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ScopedModel<ScopedDetails>(
      model: scopedDetails,
      child: Scaffold(
        backgroundColor: Colors.tealAccent,
        appBar: AppBar(
          title: Text('SCM Implementation'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Container(
          child:ScopedModelDescendant<ScopedDetails>(builder:(context,child,model){
            if(model.scopedModel.isNotEmpty){
              return ListView.builder(itemCount:model.scopedModel.length,itemBuilder: (context,index){
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10.0,
                    color:Colors.tealAccent,
                    child: ListTile(
                      leading:CircleAvatar(backgroundColor: Colors.tealAccent,child:Image.network(model.scopedModel[index].avatar),),
                      title: Row(
                        children: [
                          Text(model.scopedModel[index].firstName),
                          SizedBox(width: 5.0,),
                          Text(model.scopedModel[index].lastName),
                        ],
                      ),
                      subtitle: Text(model.scopedModel[index].email),
                    ),
                  );
                }
                );
            }
            else{
              return Center(child:CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.teal)));
            }
          }),
        ),
      ),
    );
  }
}
