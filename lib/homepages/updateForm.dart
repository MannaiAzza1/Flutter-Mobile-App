import 'package:app/Services/User.dart';
import 'package:app/Services/database.dart';
import 'package:flutter/material.dart';
import 'package:app/Shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formkey=GlobalKey<FormState>();
  String _newpassword;
  String _confirmpassword;
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
              Text("Mettre a jour votre Mot de passe ",
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
                    hintText: " votre nouveau Mot de passe",
                    hintStyle: TextStyle(color: Colors.grey,
                      fontSize: 12 ,)),
                validator: (val)=> val.isEmpty?"Entrez un valeur SVP" : null,
                onChanged: (val)=> setState(()=>_newpassword=val),


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
                validator: (val)=> val !=_newpassword ?"Les mot de passes doivent etre identiques!" : null,
                onChanged: (val)=> setState(()=>_confirmpassword=val),

              ),
              RaisedButton(
                color: Color(0xFF4C516D),
                child: Text("Valider" , style: TextStyle(color: Colors.white,
                    fontSize: 18,
                    fontFamily: "Poppins-Bold",

                    letterSpacing: 1.0 ),),
                  onPressed: () async {
                  if(_formkey.currentState.validate()){
                    final result = await  DatabaseService(uid: user.uid).UpdateUserData(human.id, human.phone, human.email, _newpassword);
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

                  }
                },

              ),
            ],
          )
        );
      }
    );
  }
}

