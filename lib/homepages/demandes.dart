import 'package:app/Services/User.dart';
import 'package:app/Services/database.dart';
import 'package:app/bloc/navigation/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Demandes extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    final user=Provider.of<User>(context);
    const kShadowColor = Color(0xFFE6E6E6);

     return StreamBuilder<UserData>(
         stream: DatabaseService(uid : user.uid).userData,

        builder: (context, snapshot) {
          UserData human = snapshot.data;
          String email = human.email;
          String id = human.id;
          return Scaffold(
              body: Stack(
                  children: <Widget>[
                    Container(
                      height: size.height * .45,
                      decoration: BoxDecoration(
                        color: Color(0xFF4C516D),

                      ),

                    ),
                    SafeArea(
                      child: Padding(
                        padding : const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: <Widget>[
                            Text("",style: Theme.of(context).textTheme.display1.copyWith(fontWeight: FontWeight.w900),),
                            Text(" Bienvenue $id",style:TextStyle(fontWeight: FontWeight.w100,color: Colors.white,fontSize: 30)),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 30),
                              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(29.5),

                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Rechercher",
                                  border: InputBorder.none,
                                  )
                              ),
                            ),
                            Expanded(
                              child: GridView.count(
                                  crossAxisCount:2,
                                  childAspectRatio: .85 ,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,

                                children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(13),
                                      boxShadow: [
                                        BoxShadow(
                                        offset: Offset(0,17),
                                        blurRadius: 17,
                                        spreadRadius: -23,
                                        color: kShadowColor,
                                      )]
                                  ),
                                  child:Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: (){},
                                      child: Column(
                                        children: <Widget>[
                                          Spacer(),
                                            Image.asset("assets/planner.png"),
                                          Spacer(),
                                          Text(
                                            " Demandes de Congés", textAlign: TextAlign.center,
                                            style: Theme.of(context).textTheme.title.copyWith(fontSize: 15),
                                          )
                                        ],
                                      ),
                                    ),
                                  )

                                ),
                                  Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(13),
                                          boxShadow: [
                                            BoxShadow(
                                            offset: Offset(0,17),
                                            blurRadius: 17,
                                            spreadRadius: -23,
                                            color: kShadowColor,
                                          )]
                                      ),
                                      child:Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: (){},
                                          child: Column(
                                            children: <Widget>[
                                              Spacer(),
                                              Image.asset("assets/reclam.png"),
                                              Spacer(),
                                              Text(
                                                " Reclamations", textAlign: TextAlign.center,
                                                style: Theme.of(context).textTheme.title.copyWith(fontSize: 15),

                                              )
                                            ],
                                          ),
                                        ),
                                      )

                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(13),
                                        boxShadow: [BoxShadow(
                                          offset: Offset(0,17),
                                          blurRadius: 17,
                                          spreadRadius: -23,
                                          color: kShadowColor,
                                        )]
                                      ),
                                      child:Material(
                                        color: Colors.transparent,

                                        child: InkWell(
                                          onTap: (){},
                                          child: Column(
                                            children: <Widget>[
                                              Spacer(),
                                              Image.asset("assets/avance.png"),
                                              Spacer(),
                                              Text(
                                                " Avance Sur Salaire", textAlign: TextAlign.center,
                                                style: Theme.of(context).textTheme.title.copyWith(fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                      )

                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(13),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0,17),
                                              blurRadius: 17,
                                              spreadRadius: -23,
                                              color: kShadowColor,
                                            )]
                                      ),
                                      child:Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: (){},
                                          child: Column(
                                            children: <Widget>[
                                              Spacer(),
                                              Image.asset("assets/feedback.png"),
                                              Spacer(),
                                              Text(
                                                "Feedback", textAlign: TextAlign.center,
                                                style: Theme.of(context).textTheme.title.copyWith(fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ),
                                      )

                                  ),
                              ],),
                            ),
                         ],

                        ),
                      ),

                    )
                  ]
              )
          );
        }
        );
    }
  }





