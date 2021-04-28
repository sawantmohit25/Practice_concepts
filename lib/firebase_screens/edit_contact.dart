import 'package:flutter/material.dart';
import 'package:sembast_app/firebase_service/database.dart';
class EditContact extends StatefulWidget {
  String documentId;
  String firstName ;
  String lastName ;
  String phoneNumber;
  String email;
  EditContact({this.documentId,this.firstName,this.lastName,this.phoneNumber,this.email});
  @override
  _EditContactState createState() => _EditContactState(documentId,firstName,lastName,phoneNumber,email);
}

class _EditContactState extends State<EditContact> {
  TextEditingController firstNameContr = TextEditingController();
  TextEditingController lastNameContr = TextEditingController();
  TextEditingController emailContr = TextEditingController();
  TextEditingController phoneNoContr = TextEditingController();
  String documentId;
  String firstName ;
  String lastName;
  String phoneNumber;
  String email;
  _EditContactState(this.documentId,this.firstName,this.lastName,this.phoneNumber,this.email);
  final _formKey = GlobalKey<FormState>();
  DatabaseService databaseService = DatabaseService();

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
  void initState() {
    setState(() {
      firstNameContr.text=firstName;
      lastNameContr.text=lastName;
      phoneNoContr.text=phoneNumber;
      emailContr.text=email;
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[300],
      appBar: AppBar(
        title: Text('Edit Contact'),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  SizedBox(height: 20.0),
                  TextFormField(
                    style: TextStyle(color:Colors.purple),
                    decoration: InputDecoration(
                      errorStyle:TextStyle(color:Colors.white),
                      hintStyle:TextStyle(color:Colors.purple),
                      hintText: 'FirstName',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink, width: 2.0),
                      ),
                    ),
                    validator: validateFirstName,
                    controller: firstNameContr,
                    onChanged: (val) {
                      setState(() {
                        firstName = val;
                      });
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    style: TextStyle(color:Colors.purple),
                    decoration: InputDecoration(
                      errorStyle:TextStyle(color:Colors.white),
                      hintStyle:TextStyle(color:Colors.purple),
                      hintText: 'LastName',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink, width: 2.0),
                      ),
                    ),
                    validator: validateLastName,
                    controller: lastNameContr,
                    onChanged: (val) {
                      setState(() {
                        lastName = val;
                      });
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    style: TextStyle(color:Colors.purple),
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      errorStyle:TextStyle(color:Colors.white),
                      hintStyle:TextStyle(color:Colors.purple),
                      hintText: 'PhoneNumber',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink, width: 2.0),
                      ),
                    ),
                    validator: validatePhone,
                    controller:phoneNoContr,
                    onChanged: (val) {
                      setState(() {
                        phoneNumber = val;
                      });
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    style: TextStyle(color:Colors.purple),
                    decoration: InputDecoration(
                      errorStyle:TextStyle(color:Colors.white),
                      hintStyle:TextStyle(color:Colors.purple),
                      hintText: 'Email',
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink, width: 2.0),
                      ),
                    ),
                    validator: validateEmail,
                    controller:emailContr,
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(onPressed: () {
                    if (_formKey.currentState.validate()) {
                      databaseService.editContact(documentId,firstName, lastName, phoneNumber, email);
                      Navigator.pop(context);
                    }
                  }, color: Colors.white,
                    child: Text('EDIT', style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),),),
                ],
              ),
            )
        ),
      ),
    );
  }
}
