import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sembast_app/firebase_screens/edit_contact.dart';
import 'package:sembast_app/firebase_service/database.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class DisplayContact extends StatefulWidget {
  @override
  _DisplayContactState createState() => _DisplayContactState();
}

class _DisplayContactState extends State<DisplayContact> {
  DatabaseService databaseService=DatabaseService();
  List<DocumentSnapshot> documents=List();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream:databaseService.phoneCollection.snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            documents=snapshot.data.documents;
            return Container(
              padding: const EdgeInsets.fromLTRB(20.0,30.0,20.0,0),
              child: Column(
                children: [
                  Column(children:documents.map((doc){
                    return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      secondaryActions: [
                        Container(height:45,width:45,decoration:BoxDecoration(color: Colors.purple,shape: BoxShape.circle, border: Border.all(width: 2, color: Colors.white)),
                            child: IconButton(icon:Icon(Icons.delete,color: Colors.white,),
                              onPressed: (){
                                databaseService.deleteContact(doc.documentID);
                              },)),
                      ],
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 10.0,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.purple,
                            child: Icon(Icons.person,color: Colors.white,),
                          ),
                          title: Row(
                            children: [
                              Text(doc['firstName'],),
                              SizedBox(width: 5.0,),
                              Text(doc['lastName'],),
                            ],
                          ),
                          subtitle:Text(doc['email']),
                          trailing: IconButton(icon:Icon(Icons.edit,color: Colors.purple,), onPressed:(){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=> EditContact(documentId:doc.documentID,firstName:doc['firstName'],lastName:doc['lastName'],phoneNumber:doc['phoneNumber'],email: doc['email'],)));
                          }),
                        ),
                      ),
                    );
                  }).toList())
                ],
              ),
            );
          }
          else{
            return Center(
              child: SpinKitChasingDots(
                color: Colors.white,
                size: 50.0,
              ),
            );
          }
        }
    );
  }
}
