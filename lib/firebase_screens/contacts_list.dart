import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sembast_app/firebase_model/contacts_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    final contacts=Provider.of<List<Contacts>>(context);
    return contacts!=null?Container(
      padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('All Contacts Saved:-',style: TextStyle(color: Colors.white,fontSize: 30),),
            ],
          ),
          SizedBox(height: 15.0,),
          ListView.builder(shrinkWrap: true,itemCount:contacts?.length??0,itemBuilder:(context,index){
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Icon(Icons.person,color: Colors.white,),
                ),
                title: Row(
                  children: [
                    Text(contacts[index].firstName),
                    SizedBox(width: 5.0,),
                    Text(contacts[index].lastName),
                  ],
                ),
                subtitle:Text(contacts[index].email),
              ),
            );
          })
        ],
      ),
    ):Center(
      child: SpinKitChasingDots(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
