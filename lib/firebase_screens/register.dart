import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sembast_app/firebase_service/authentication.dart';
class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthenticationService _auth =AuthenticationService();
  final _formKey = GlobalKey<FormState>();
  String email='';
  String password='';
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
  String validatePass(val) {
    if (val.isEmpty) {
      return 'Required';
    }
    else if(val.toString().length<6) // Can be used Regex for extra validation Minimum 1 uppercase,lowercase,1 numeric number,1 special character,allow common char RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'
        {
      return 'Password should be minimum of 6 characters';
    }
    else{
      return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Register'),
        actions:<Widget> [
          FlatButton.icon(icon:Icon(Icons.person,color: Colors.white,), label:Text('Sign In',style: TextStyle(color: Colors.white),),onPressed: (){
            widget.toggleView();
          },)
        ],
      ),
      backgroundColor: Colors.purple[200],
      body:Container(
          padding: const EdgeInsets.fromLTRB(50.0,20.0,50.0,0),
          child:Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(errorStyle:TextStyle(color:Colors.white),hintText:'Email',fillColor: Colors.white,filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.white,width: 2.0),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.pink,width: 2.0),
                    ),
                  ),
                  validator:validateEmail,
                  onChanged: (val){
                    setState(() {
                      email=val;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(errorStyle:TextStyle(color:Colors.white),hintText:'Password',fillColor: Colors.white,filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.white,width: 2.0),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.pink,width: 2.0),
                    ),
                  ),
                  validator: validatePass,
                  onChanged: (val){
                    setState(() {
                      password=val;
                    });
                  },
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                RaisedButton(onPressed: ()async{
                  if(_formKey.currentState.validate()){
                    dynamic result =await _auth.registerWithEmailAndPassword(email, password);
                    if(result==null){
                      Fluttertoast.showToast(
                          msg:'Please Supply a Valid Email',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.purple,
                          textColor: Colors.white
                      );
                    }
                  }
                },color: Colors.white,
                  child: Text('Register',style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),),),
              ],
            ),
          )
      ),
    );
  }
}

