import 'package:app/Services/User.dart';
import 'package:app/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:app/Shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SettingsFormEmail extends StatefulWidget {
  @override
  _SettingsFormEmailState createState() => _SettingsFormEmailState();
}

class _SettingsFormEmailState extends State<SettingsFormEmail> {
  final _formkey=GlobalKey<FormState>();
  String _newEmail;
  String _confirmEmail;
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<User>(context);
    return StreamBuilder<UserData>(

      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        UserData human = snapshot.data;
        return Form(

          key: _formkey,
          child:Column(
            children: <Widget>[
              Text("Mettre a jour votre Email ",
                  style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(26),
                    fontFamily: "Poppins-Meduim",)
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration (
                    hintText: " votre nouveau Email",
                    hintStyle: TextStyle(color: Colors.grey,
                      fontSize: 12 ,)),
                validator: (val)=> val.isEmpty?"Entrez un valeur SVP" : null,
                onChanged: (val)=> setState(()=>_newEmail=val),


              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration (
                 // prefixIcon: Icon(Icons.person),
                  hintText: " Confirmer votre mot de pass",
                  hintStyle: TextStyle(color: Colors.grey,
                    fontSize: 12 ,)),
                validator: (val)=> val !=_newEmail ?"Les mot de passes doivent etre identiques!" : null,
                onChanged: (val)=> setState(()=>_confirmEmail=val),

              ),
              RaisedButton(
                color: Color(0xFF4C516D),
                child: Text("Valider" , style: TextStyle(color: Colors.white,
                    fontSize: 18,
                    fontFamily: "Poppins-Bold",

                    letterSpacing: 1.0 ),),
                  onPressed: () async {
                    if(_formkey.currentState.validate()){
                      final result = await DatabaseService(uid: user.uid).UpdateUserData(
                          human.id,
                          human.phone
                          , _newEmail,
                          human.password
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
    );
  }
}

