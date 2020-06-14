import 'package:app/Services/User.dart';
import 'package:app/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:app/Shared/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
class SettingsFormID extends StatefulWidget {
  @override
  _SettingsFormStateID createState() => _SettingsFormStateID();
}

class _SettingsFormStateID extends State<SettingsFormID> {
  final _formkey=GlobalKey<FormState>();
  String _newId;
  String _confirmId;
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<User>(context);
       return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
            builder: (context, snapshot) {
              UserData human = snapshot.data;
              {
                return Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[
                        Text("Mettre a jour votre ID ",
                            style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(26),
                              fontFamily: "Poppins-Meduim",)
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: " votre nouveau ID",
                              hintStyle: TextStyle(color: Colors.grey,
                                fontSize: 12,)),
                          validator: (val) =>
                          val.isEmpty
                              ? "Entrez un valeur SVP"
                              : null,
                          onChanged: (val) => setState(() => _newId = val),


                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            // prefixIcon: Icon(Icons.person),
                              hintText: " Confirmer votre mot de pass",
                              hintStyle: TextStyle(color: Colors.grey,
                                fontSize: 12,)),
                          validator: (val) =>
                          val != _newId
                              ? "Les mot de passes doivent etre identiques!"
                              : null,
                          onChanged: (val) => setState(() => _confirmId = val),

                        ),
                        RaisedButton(
                          color: Color(0xFF4C516D),
                          child: Text(
                            "Valider", style: TextStyle(color: Colors.white,
                              fontSize: 18,
                              fontFamily: "Poppins-Bold",

                              letterSpacing: 1.0),),
                          onPressed: () async {
                            if (_formkey.currentState.validate()) {
                              final result =await DatabaseService(uid: user.uid)
                                  .UpdateUserData(
                                  _newId,
                                  human.phone,
                                  human.email,
                                  human.password,

                              );
                              if(result!=null)
                              { AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),

                                ),
                                title: Text("Success"),
                                content:  Text("Your informations were updated"),
                              );}
                              else{
                                AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),

                                  ),
                                  title: Text("Error"),
                                  content:  Text("An error has Accured"),
                                );

                              }

                            };
                          },

                        ),
                      ],
                    )
                );
              }
            });
      }
    }




