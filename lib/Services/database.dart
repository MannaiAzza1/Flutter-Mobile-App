import 'package:app/Services/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import 'human.dart';
class DatabaseService{

  final String uid;
  DatabaseService({this.uid});

final CollectionReference RhumCollection=Firestore.instance.collection("users");

Future UpdateUserData(String Id , String phone,String email,String password) async{
  return await RhumCollection.document(uid).setData(
    {
      'ID' : Id,
      "email" : email,
      "password" : password,
      "phone" : phone,





    }
  );
}
//human list
  List<Human> _humanlistFromSnapshot (QuerySnapshot snapshot)
  {
    return snapshot.documents.map((doc){
    return Human(
      id: doc.data['id'] ?? ' ' ,
      email: doc.data['email'] ?? ' ',
      phone: doc.data['phone'],
      password: doc.data['password'] ?? ' ' ,



    );}) .toList(); }
    // user data from snapshot
  UserData _userDatafromsnapshot(DocumentSnapshot snapshot){
  return UserData(
    uid: uid,
    email: snapshot.data["email"],
    id: snapshot.data["ID"],
    password: snapshot.data["password"],
    phone: snapshot.data["phone"],





  );

  }

//catch stream
Stream <List<Human>> get humans{
  return RhumCollection.snapshots().map(_humanlistFromSnapshot);
}
// get user data
Stream<UserData> get userData{
  return RhumCollection.document(uid).snapshots().map(_userDatafromsnapshot);

}
//delete user
  Future DeleteUser(uid) async{

   return RhumCollection.document(uid).delete().catchError((e){print(e);});




  }



}