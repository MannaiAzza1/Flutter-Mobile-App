

import 'package:app/Services/human.dart';
import 'package:app/Widgets/userslist.dart';
import 'package:app/bloc/navigation/bloc/navigation_bloc.dart';
import 'package:app/homepages/updateForm.dart';
import 'package:flutter/material.dart';
import'package:app/Services/database.dart';
import 'package:provider/provider.dart';

import 'Settings.dart';
import 'add.dart';
class Firstpage extends StatelessWidget with NavigationStates {
  @override

  Widget build(BuildContext context) {
    void _showSettingsPanel( ){
      showModalBottomSheet(context: context, builder: (context)
      {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 60),
          child: Add(),

        );

      });



    };


    return StreamProvider<List<Human>>.value (
      value:DatabaseService().humans,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: UsersList(),
        floatingActionButton:  FloatingActionButton(
          backgroundColor:Color(0xFF4C516D),
          child: Icon(Icons.add),
            onPressed: () => _showSettingsPanel(),
        ),


      ),
    );
  }
}
