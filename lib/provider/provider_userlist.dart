import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sembast_app/provider/provider_api_response.dart';
import 'package:sembast_app/model_class/usermodel.dart';

/// Here the changes are  listened by listener and we  use Consumer to render those changes provided by provider using Provider state management technique.
class ProviderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ProviderResponse>(context).getData('https://jsonplaceholder.typicode.com/posts');
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Implementation'),
        backgroundColor: Colors.red,
      ),
      backgroundColor:Colors.redAccent,
      body:Container(
        child: Consumer<ProviderResponse>(builder:(context,data,child){
          return ListView.builder(itemCount:data.users.length,itemBuilder:(context,index){
            if(data.users.isNotEmpty){
              return Column(
                children: [
                  ListTile(
                    leading:CircleAvatar(backgroundColor: Colors.red[700],child: Text(data.users[index].id.toString(),style: TextStyle(color:Colors.white),)),
                    title: Text(data.users[index].title,style: TextStyle(color:Colors.white),),
                  ),
                  Divider(thickness: 2.0,height: 2.0)
                ],
              );
            }
            else{
              return Text('bolte');
            }
          });
        }),
      ),
    );
  }
}
