
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/sidebar/sidebarlayout.dart';
import 'package:app/main.dart';



class Home extends StatefulWidget{


  @override


  _HomeState createState() => _HomeState ();

}

class _HomeState extends State<Home>
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.white,
        ),

        home: SideBarLayout(),

      );


        }

}