import 'package:app/bloc/navigation/bloc/navigation_bloc.dart';
import 'package:app/homepages/firstpage.dart';
import 'package:app/sidebar/sidebar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:app/Services/User.dart';
class SideBarLayout extends StatelessWidget {
  SideBarLayout({this.passedValue});
  String passedValue;
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: BlocProvider<NavigationBloc>(
            create: (context)=> NavigationBloc(),
            child: Stack(
              children: <Widget>[
                BlocBuilder<NavigationBloc,NavigationStates>(
                  builder: (context,navigationState){
                    return navigationState as Widget;
                  }
                ),
                SideBar(),
              ],
            )
          ),




    );

    }
}
