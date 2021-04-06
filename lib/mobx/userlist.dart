import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:sembast_app/mobx/user_store.dart';
import 'package:sembast_app/model_class/usermodel.dart';

///Here the API values get rendered in the screen using observer widget of the mobx plugin.
class UserList extends StatelessWidget {
  UserStore store =UserStore();
  UserList(){
    store.getTheUsers();
  }
  @override
  Widget build(BuildContext context) {
    final future =  store.userListFuture;
    print('mandar${future.value}');
    return Observer(builder:(_){
      if(future.status ==FutureStatus.pending){
        return Center(child: CircularProgressIndicator());
      }
      else if(future.status == FutureStatus.rejected){
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Failed to load items.',
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: const Text('Tap to retry'),
                onPressed: _refresh,
              )
            ],
          ),
        );
      }
      else if(future.status==FutureStatus.fulfilled){
        List<UserModel> usersList =future.value;
        return Scaffold(
          appBar: AppBar(
            title: Text('MobX Implementation'),
          ),
          backgroundColor:Colors.lightBlueAccent,
          body:Container(
            child: ListView.builder(itemCount:usersList.length,itemBuilder:(context,index){
              return Column(
                children: [
                  ListTile(
                    leading:CircleAvatar(child: Text(usersList[index].id.toString(),style: TextStyle(color:Colors.white),)),
                    title: Text(usersList[index].title,style: TextStyle(color: Colors.white),),
                  ),
                  Divider(thickness: 2.0,height: 2.0)
                ],
              );
            }),
          ),
        );
      }
      else{
        return Text('hi');
      }
    });
  }

   Future _refresh() {
    store.fetchUsers();
  }
}
