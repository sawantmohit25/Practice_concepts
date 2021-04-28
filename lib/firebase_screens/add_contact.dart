import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sembast_app/firebase_screens/display_contacts.dart';
import 'package:sembast_app/firebase_service/database.dart';
class AddContact extends StatefulWidget {
  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final _formKey = GlobalKey<FormState>();
  DatabaseService databaseService=DatabaseService();
  String firstName='';
  String lastName='';
  String phoneNumber='';
  String email='';
  String validateLastName(val) {
    if (val.isEmpty) {
      return 'Required';
    }
    if (!RegExp(r'^[a-z A-Z,.\-]+$').hasMatch(val)) {
      return 'Please Enter A valid Name';
    }
    return null;
  }

  String validateFirstName(val) {
    if (val.isEmpty) {
      return 'Required';
    }
    if (!RegExp(r'^[a-z A-Z,.\-]+$').hasMatch(val)) {
      return 'Please Enter A valid Name';
    }
    return null;
  }
  String validatePhone(val) {
    if (val.isEmpty) {
      return 'Required';
    }
    if (val.length < 10) {
      return 'Please enter a 10 digit Phone Number';
    }
    if (val.length > 10) {
      return 'Please enter a 10 digit Phone Number';
    }
    return null;
  }
  String validateEmail(val) {
    if (val.isEmpty) {
      return 'Required';
    }
    if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(val)) {
      return 'Please Enter a valid Email Address';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.purple[300],
      appBar: AppBar(
        title: Text('Add Contact'),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20.0,50.0,20.0,0),
          child:Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                SizedBox(height: 20.0),
                TextFormField(
                  style: TextStyle(color:Colors.purple),
                  decoration: InputDecoration(errorStyle:TextStyle(color:Colors.white),hintStyle:TextStyle(color:Colors.purple),hintText:'FirstName',fillColor: Colors.white,filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.white,width: 2.0),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.pink,width: 2.0),
                    ),
                  ),
                  validator:validateFirstName,
                  onChanged: (val){
                    setState(() {
                      firstName=val;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  style: TextStyle(color:Colors.purple),
                  decoration: InputDecoration(errorStyle:TextStyle(color:Colors.white),hintStyle:TextStyle(color:Colors.purple),hintText:'LastName',fillColor: Colors.white,filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.white,width: 2.0),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.pink,width: 2.0),
                    ),
                  ),
                  validator: validateLastName,
                  onChanged: (val){
                    setState(() {
                      lastName=val;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  style: TextStyle(color:Colors.purple),
                  keyboardType:TextInputType.phone,
                  decoration: InputDecoration(errorStyle:TextStyle(color:Colors.white),hintStyle:TextStyle(color:Colors.purple),hintText:'PhoneNumber',fillColor: Colors.white,filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.white,width: 2.0),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.pink,width: 2.0),
                    ),
                  ),
                  validator: validatePhone,
                  onChanged: (val){
                    setState(() {
                      phoneNumber=val;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  style: TextStyle(color:Colors.purple),
                  decoration: InputDecoration(errorStyle:TextStyle(color:Colors.white),hintStyle:TextStyle(color:Colors.purple),hintText:'Email',fillColor: Colors.white,filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.white,width: 2.0),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.pink,width: 2.0),
                    ),
                  ),
                  validator: validateEmail,
                  onChanged: (val){
                    setState(() {
                      email=val;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(onPressed: (){
                  if(_formKey.currentState.validate()){
                    databaseService.addContact(firstName, lastName, phoneNumber, email);
                    Navigator.pop(context);
                  }
                },color: Colors.white,
                  child: Text('ADD',style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),),),
              ],
            ),
          )
        ),
      ),
    );
  }
}
