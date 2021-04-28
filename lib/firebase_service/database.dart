import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sembast_app/firebase_model/contacts_model.dart';
class DatabaseService{
  final String uid;
  DatabaseService({this.uid});

final CollectionReference contactsCollection=Firestore.instance.collection('contacts');

final CollectionReference phoneCollection=Firestore.instance.collection('phones');

//Working Code below used in this Project for firestore.

void addContact(String firstName,String lastName,String phoneNumber,String email) async{
   await phoneCollection.add({'firstName':firstName,'lastName':lastName,'phoneNumber':phoneNumber,'email':email});
   Fluttertoast.showToast(
       msg:'Contact Added Successfully',
       toastLength: Toast.LENGTH_SHORT,
       gravity: ToastGravity.BOTTOM,
       backgroundColor: Colors.purple,
       textColor: Colors.white
   );
}
void deleteContact(String documentId) async{
  await phoneCollection.document(documentId).delete();
  Fluttertoast.showToast(
      msg:'Contact Deleted Successfully',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.purple,
      textColor: Colors.white
  );
}
void editContact(String documentId,String firstName,String lastName,String phoneNumber,String email) async{
  await phoneCollection.document(documentId).updateData({'firstName':firstName,'lastName':lastName,'phoneNumber':phoneNumber,'email':email});
  Fluttertoast.showToast(
      msg:'Contact Updated Successfully',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.purple,
      textColor: Colors.white
  );
}

//Net Ninja Code Reference below not used in this prjoect for firestore.

Future updateUserContact(String firstName,String lastName,String phoneNumber,String email) async{
    return await contactsCollection.document(uid).setData({'firstName':firstName,'lastName':lastName,'phoneNumber':phoneNumber,'email':email});
  }
List<Contacts> _contactsListFromSnapshot(QuerySnapshot snapshot){
  return snapshot.documents.map((doc){
    return Contacts(
      firstName: doc.data['firstName']??'',
      lastName: doc.data['lastName']??'',
      phoneNumber: doc.data['phoneNumber']??'',
      email: doc.data['email']??''
    );
  }).toList();
}
  List<Contacts> _phoneListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Contacts(
          firstName: doc.data['firstName']??'',
          lastName: doc.data['lastName']??'',
          phoneNumber: doc.data['phoneNumber']??'',
          email: doc.data['email']??''
      );
    }).toList();
  }
  Stream<List<Contacts>> get phones{
    return contactsCollection.snapshots().map((_phoneListFromSnapshot));
  }
Stream<List<Contacts>> get contacts{
  return contactsCollection.snapshots().map((_contactsListFromSnapshot));
}
}