import 'package:app/Services/User.dart';
import 'package:app/Services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  final _formkey=GlobalKey<FormState>();
  String email;
  String id;
  String phone;
  String password;
  User user ;
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {

          return Form(

              key: _formkey,
              child:Column(
                children: <Widget>[
                  Text("Ajouter",
                      style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(35),
                        fontFamily: "Poppins-Meduim",
                        color: Color(0xFF4C516D),
                      )
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(

                    decoration: InputDecoration (
                        hintText: " ID",
                        hintStyle: TextStyle(color: Colors.grey,
                          fontSize: 12 ,)),
                    validator: (val)=> val.isEmpty?"Entrez un valeur SVP" : null,
                    onChanged: (val)=> setState(()=>id=val),


                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration (
                      // prefixIcon: Icon(Icons.person),
                        hintText: " email",
                        hintStyle: TextStyle(color: Colors.grey,
                          fontSize: 12 ,)),
                    validator: (val)=> val.isEmpty?"Entrez un valeur SVP" : null,
                    onChanged: (val)=> setState(()=>email=val),

                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(

                    decoration: InputDecoration (
                      // prefixIcon: Icon(Icons.person),
                        hintText: " phone",
                        hintStyle: TextStyle(color: Colors.grey,
                          fontSize: 12 ,)),
                    validator: (val)=> val.isEmpty?"Entrez un valeur SVP" : null,
                    onChanged: (val)=> setState(()=>phone=val),

                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration (
                      // prefixIcon: Icon(Icons.person),
                        hintText: " password",
                        hintStyle: TextStyle(color: Colors.grey,
                          fontSize: 12 ,)),
                    validator: (val)=> val.isEmpty?"Entrez un valeur SVP" : null,
                    onChanged: (val)=> setState(()=>password=val),

                  ),
                  RaisedButton(
                    color: Color(0xFF4C516D),
                    child: Text("Valider" , style: TextStyle(color: Colors.white,
                        fontSize: 18,
                        fontFamily: "Poppins-Bold",

                        letterSpacing: 1.0 ),),
                    onPressed: () async {
                      if(_formkey.currentState.validate()){
                        dynamic result=await _auth.SingInWithEmail(email,password,id,phone);
                        AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),

                          ),
                          title: Text("Success"),
                          content:  Text("Your User was added"),
                        );


                      };
                    },

                  ),
                ],
              )
          );
        }

  }


