import 'package:flutter/material.dart';
import 'package:sembast_app/model_class/usermodel.dart';
import 'package:sembast_app/rxdart/user_list_bloc.dart';
class UsersList extends StatefulWidget {
  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  final userObj=UserListBloc();
  @override
  void initState() {
    userObj.getData();
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    userObj.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        title: Text('RxDart Implementation'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body:StreamBuilder<List<UserModel>>(
        stream:userObj.subjectUser.stream,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<UserModel> usersList =snapshot.data;
            return ListView.builder(itemCount:usersList.length,itemBuilder:(context,index){
              if(usersList.isNotEmpty){
                return Column(
                  children: [
                    ListTile(
                      leading:CircleAvatar(backgroundColor: Colors.green[700],child: Text(usersList[index].id.toString(),style: TextStyle(color:Colors.white),)),
                      title: Text(usersList[index].title,style: TextStyle(color:Colors.white),),
                    ),
                    Divider(height: 2.0,thickness: 2.0)
                  ],
                );
              }
              else{
                return CircularProgressIndicator();
              }
            });
          }
          else{
            return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.green)));
          }
        }
      ),
    );
  }
}
