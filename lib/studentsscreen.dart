import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sembast_app/mvvm_implementation/employee_list.dart';
import 'package:sembast_app/provider/provider_userlist.dart';
import 'package:sembast_app/rxdart/rxdart_user_list.dart';
import 'package:sembast_app/scoped_model/scoped_employee_list.dart';
import 'package:sembast_app/sembast/student_dao.dart';
import 'package:sembast_app/sembast/studentmodel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sembast_app/mobx/userlist.dart';

/// On this Screen Sembast implementation is rendered and there are two floating buttons used to navigate to show mobx and provider implementation.
class StudentsScreen extends StatefulWidget {
  @override
  _StudentsScreenState createState() => _StudentsScreenState();
}

class _StudentsScreenState extends State<StudentsScreen> {
  String name;
  String rollNo;
  final studentDaoObj=StudentDao();
  final studentObj=Student();
  TextEditingController studentRollNumber =TextEditingController();
  TextEditingController studentName =TextEditingController();
  Future<List<Student>> studentsList;
   @override
  void dispose() {
    studentRollNumber.dispose();
    studentName.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(heroTag: 'btn1',child:Text('MobX'),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder:(context) =>UserList() ));
              },
            ),
            SizedBox(height: 5.0),
            FloatingActionButton(backgroundColor: Colors.red,heroTag: 'btn2',onPressed:(){
              Navigator.push(context,MaterialPageRoute(builder:(context) =>ProviderList() ));
            },child: Text('Provide'),),
            SizedBox(height: 5.0),
            FloatingActionButton(backgroundColor: Colors.amber,heroTag: 'btn3',onPressed:(){
              Navigator.push(context,MaterialPageRoute(builder:(context) =>EmployeeList() ));
            },child: Text('MVVM'),),
            SizedBox(height: 5.0),
            FloatingActionButton(backgroundColor: Colors.green,heroTag: 'btn4',onPressed:(){
              Navigator.push(context,MaterialPageRoute(builder:(context) =>UsersList() ));
            },child: Text('RxDart'),),
            SizedBox(height: 5.0),
            FloatingActionButton(backgroundColor: Colors.teal,heroTag: 'btn5',onPressed:(){
              Navigator.push(context,MaterialPageRoute(builder:(context) =>EmployeeDetails() ));
            },child: Text('SCM'),),
          ],
        ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Students Information'),
      ),
      body:SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0,20.0,10.0,0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Roll Number',),
                  ],
                ),
                SizedBox(height: 5.0),
                TextField(controller:studentRollNumber,decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blue, width: 0.0),),
                  hintText:'Enter Your Roll no',
                  hintStyle:TextStyle(color:Colors.blue),
                ),onChanged:(value){
                  rollNo=value;
                },),
                SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Name'),
                  ],
                ),
                SizedBox(height: 5.0),
                TextField(controller:studentName,decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.blue, width: 0.0),),
                  hintText:'Enter Your Name',
                  hintStyle:TextStyle(color:Colors.blue),
                ),onChanged:(value){
                  name=value;
                },),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width:80.0,
                      height:40.0,
                      child: RaisedButton(color:Colors.blue,onPressed:(){
                        Student students=Student();
                        students.rollNo=rollNo;
                        students.name=name;
                        studentDaoObj.insertStudent(students);
                        Fluttertoast.showToast(
                            msg:'Student Inserted successfully !!',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white
                        );
                      },
                        child: Text('Insert',style: TextStyle(color: Colors.white),),),
                    ),
                    Container(
                      width:80.0,
                      height:40.0,
                      child: RaisedButton(color: Colors.blue,onPressed:(){
                        setState(() {
                          studentsList=studentDaoObj.getAllStudents();
                        });
                        print(studentsList);
                      },
                        child: Text('Display All',style: TextStyle(color: Colors.white),),),
                    ),
                    Container(
                      width:80.0,
                      height:40.0,
                      child: RaisedButton(color:Colors.blue,onPressed:(){
                          Student updateStudents=Student();
                          updateStudents.rollNo=rollNo;
                          updateStudents.name=name;
                          studentDaoObj.updateStudent(updateStudents);
                        Fluttertoast.showToast(
                            msg:'Student Updated successfully !!',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white
                        );
                      },
                        child: Text('Update',style: TextStyle(color: Colors.white),),),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Container(
                  child: FutureBuilder(future:studentsList,builder:(context,snapshot){
                    if(snapshot.hasData){
                      List<Student> students =snapshot.data;
                      return Column(
                        children: [
                          ListView.builder(physics:BouncingScrollPhysics(),shrinkWrap: true,itemCount:students.length,itemBuilder:(context,index){
                            final displayedStudents =students[index];
                            return Column(
                              children: [
                                Container(
                                  color: Colors.blue,
                                  child: ListTile(
                           leading:Text(students[index].rollNo!=null?students[index].rollNo:'',style: TextStyle(color: Colors.white),),
                                    title: Text(students[index].name!=null?students[index].name:'',style: TextStyle(color: Colors.white),),
                                    trailing:Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(color: Colors.amber,icon:Icon(Icons.edit), onPressed:(){
                                          setState(() {
                                            studentName.text=students[index].name;
                                            studentRollNumber.text=students[index].rollNo;
                                          });
                                        }),
                                        IconButton(color: Colors.amber,icon:Icon(Icons.delete), onPressed:(){
                                          setState(() {
                                            print('hello');
                                            studentDaoObj.delete(displayedStudents);
                                            students.removeAt(index);
                                          });
                                        }),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(height: 5.0,thickness: 2.0,)
                              ],
                            );
                          }),
                        ],
                      );
                    }
                    else{
                      return Text('');
                    }
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
