import 'package:app/Services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:app/Services/User.dart';
import 'package:app/Widgets/SignUp.dart';
class AuthService {


final FirebaseAuth _auth = FirebaseAuth.instance;





  User  _userFromFirebaseUser(FirebaseUser user)  {
    return user != null? User(uid: user.uid) : null;


}
Stream<User> get user{
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
}
Future SingWithEmailAndPassword( String email , String password ) async {
  try{
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email.trim(), password: password);
    FirebaseUser user = result.user;
    return _userFromFirebaseUser(user);
  } catch(e) {
    print(e.toString());
    return null;

  }

}

Future SingInWithEmail( String email , String password , String id,String num) async {
  try{
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password);
    FirebaseUser user = result.user;
    User use;
    await DatabaseService(uid: user.uid).UpdateUserData( id, num ,  email, password);
    return _userFromFirebaseUser(user);
  } catch(e) {
print(e.toString());
    return null;

  }

}
// Sign in anon
Future singInAnon() async{
  try{
    AuthResult  result = await _auth.signInAnonymously();
    FirebaseUser user = result.user;
    return user;
  }
  catch(e)
  {
print(e.toString());
    return null ;
  }
}
Future SendRestPassword(String email)async{
    return _auth.sendPasswordResetEmail(email: email);


}
Future SignOut() async{
    try{
      return await _auth.signOut();
    } catch(e)
  {
    print(e.toString());
    return null;
  }

}
}