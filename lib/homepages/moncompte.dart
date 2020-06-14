import 'package:app/bloc/navigation/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
class MonCompte extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("account" , style: TextStyle( fontWeight: FontWeight.w900,fontSize: 28),),
      ),
    );
  }
}
