import'package:app/Services/database.dart';
import 'package:app/Services/human.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'humanTile.dart';
class UsersList extends StatefulWidget {
  @override
  _UsersListState createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  @override
  Widget build(BuildContext context) {
    final humans =Provider.of<List<Human>>(context)?? [];
    //print(humans.documents);
    humans.forEach((Human){
      print(Human.id);
      print(Human.email);
      print(Human.phone);



    });
    return ListView.builder(
        itemCount: humans.length,
        itemBuilder: (context,index){
          return HumanTile( human : humans[index]);

        });


  }
}
