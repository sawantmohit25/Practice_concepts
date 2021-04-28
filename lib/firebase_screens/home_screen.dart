import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sembast_app/firebase_model/contacts_model.dart';
import 'package:sembast_app/firebase_screens/add_contact.dart';
import 'package:sembast_app/firebase_screens/contacts_list.dart';
import 'package:sembast_app/firebase_screens/display_contacts.dart';
import 'package:sembast_app/firebase_service/authentication.dart';
import 'package:provider/provider.dart';
import 'package:sembast_app/firebase_service/database.dart';
class HomeScreen extends StatelessWidget {
  final AuthenticationService _auth =AuthenticationService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Contacts>>.value(
      value: DatabaseService().phones,
      child: Scaffold(
        backgroundColor:Colors.purple[300],
        appBar: AppBar(
          title: Text('Contacts'),
          backgroundColor: Colors.purple,
          actions:<Widget> [
            FlatButton.icon(icon:Icon(Icons.person,color:Colors.white,), label:Text('Logout',style: TextStyle(color: Colors.white),),onPressed: () async{
              await _auth.signOut();
            },)
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(backgroundColor: Colors.purple,icon:Icon(Icons.add_call,color:Colors.white,),onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder:(context)=> AddContact()));
        }, label:Text('Add Contact',style: TextStyle(color: Colors.white),)),
        body:DisplayContact(),
      ),
    );
  }
}
