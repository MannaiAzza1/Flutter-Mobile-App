import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/Services/human.dart';
import 'package:app/Services/database.dart';
import 'package:app/Services/User.dart';
import 'package:provider/provider.dart';
class HumanTile extends StatelessWidget {
  final Human human;
  HumanTile( {this.human });
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<User>(context);
    final collRef = Firestore.instance.collection('users');
    DocumentReference docReference = collRef.document();

    return Padding(
      padding: EdgeInsets.only(top : 8.0),
      child:   Card (
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Color(0xFF4C516D),



          ),
          title: Text(human.email )
          ,
          subtitle: Text('Avec un numéro ${human.phone}' ),
          trailing:IconButton(
            icon: Icon(Icons.delete_outline),
            onPressed : () async {
              final result = await  DatabaseService(uid: user.uid).DeleteUser(docReference);
              print ("succes");
            }
          ),
        ),

      ),

    );
  }
}
