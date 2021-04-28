import 'package:firebase_auth/firebase_auth.dart';
import 'package:sembast_app/firebase_model/user_model.dart';
import 'package:sembast_app/firebase_service/database.dart';

class AuthenticationService{
  final FirebaseAuth _auth =FirebaseAuth.instance;

  //Create User object based on Firebase User
  User _userFromFirebaseUser(FirebaseUser user){
    return user!=null?User(uid: user.uid):null;
  }


  // Auth changes user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged.
    // map((FirebaseUser user) => _userFromFirebaseUser(user)) ;
    map( _userFromFirebaseUser);
  }

  //Sign in Anonymous
Future SignInAnon()async{
  try{
    AuthResult result = await _auth.signInAnonymously();
    FirebaseUser user = result.user;
    return _userFromFirebaseUser(user);
  }
  catch(e){
    print(e.toString());
    return null;
  }
}

//Register with email and Password
  Future registerWithEmailAndPassword(String email, String password) async{
    try{
      AuthResult result=await _auth.createUserWithEmailAndPassword(email:email, password:password);
      FirebaseUser user=result.user;
      await DatabaseService(uid:user.uid).updateUserContact('Saurabh','VishwaKarma', '123456789', 'saurabh@gmail.com');
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
//Sign In with Email and Password
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      AuthResult result=await _auth.signInWithEmailAndPassword(email:email, password:password);
      FirebaseUser user=result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
//Sign Out
Future signOut() async{
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
}

}