

import 'package:flutter/cupertino.dart';

class Human {
  final String id;
  final String email;
  final String phone;
  final String password;
  final String IDDoc;
  Human({this.id,this.email,this.phone,this.password,this.IDDoc});
  Map<String,dynamic> toMap(){
    return {
      "id":id,
      "email":email,
      "phone":phone,
      "password":password,



  };
  }
  static Human fromMap(Map<String,dynamic> map,String DocumentID)
  {
    if (map==null)
      return null;
    return Human(
      id: map["id"],
      phone: map["phone"],
      password: map["password"],
      email: map["email"],


    );


  }
}