import 'package:app/Services/auth.dart';
import 'package:app/Widgets/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/Services/User.dart';
import 'package:app/Widgets/FormCard.Dart';
import 'package:app/Widgets/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app/Widgets/Dialogs2.dart';
import 'package:app/Widgets/loading.dart';
import 'package:provider/provider.dart';
import 'resetpassword.dart';


class Auth extends StatefulWidget {
  @override
  _AuthState createState() => new _AuthState();
}

class _AuthState extends State<Auth> {
  final AuthService _auth = AuthService();
  bool _isSelected = false;
  String email='', password='' ;
  String role='';
  final _formkey=GlobalKey<FormState>();
  bool loading=false;

  String error;
  var _textcontroller = new TextEditingController();

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Widget radioButton(bool isSelected) =>
      Container(
          width: 16.0,
          height: 16.0,
          padding: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2.0, color: Colors.black)
          ),
          child: isSelected
              ? Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),

          ) : Container()

      );

  Widget horizontalLine() =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(140),
          height: 1.0,
          color: Colors.purple.withOpacity(.2),
        ),
      );

  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil.getInstance()
      ..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);

    return loading? Loading() : Scaffold(

        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: true,
        body: Stack(


          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Image.asset("assets/image.png",),


                ),
                Expanded(
                  child: Container(),
                ),
                //Image.asset("assets/image.png"),


              ],


            ),

            ListView(
                children: [
                  Form(
                      key: _formkey,

                      child: Padding(
                        padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
                        child: Column
                          (
                            children: <Widget>[
                              Row(

                                children: <Widget>[
                                  Image.asset(
                                      "", width: ScreenUtil.getInstance().setWidth(110))
                                ],
                              ),
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(180),

                              ),
                              Container(


                                width: double.infinity,
                                height: ScreenUtil.getInstance().setHeight(500),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(0.0, 15.0),
                                          blurRadius: 15.0),
                                      BoxShadow(

                                          color: Colors.black12,
                                          offset: Offset(0.0, 15.0),
                                          blurRadius: 15.0)
                                    ]
                                ),
                                child:
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 16.0, right: 16.0, top: 16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Authentification", style: TextStyle(
                                          fontSize: ScreenUtil.getInstance().setSp(45),
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .6
                                      )
                                      ),
                                      SizedBox(

                                        height: ScreenUtil.getInstance().setHeight(30),


                                      ),
                                      Text("Votre Email ", style: TextStyle(
                                        fontSize: ScreenUtil.getInstance().setSp(26),
                                        fontFamily: "Poppins-Meduim",)),
                                      TextFormField(
                                        validator: (val)=> val.isEmpty ? 'Entrer votre Email ': null ,
                                        onChanged: (val){
                                          setState(()=> email=val);
                                        },

                                        obscureText: false
                                        ,
                                        decoration: InputDecoration(
                                            hintText: "Saisir votre ID ",
                                            hintStyle: TextStyle(color: Colors.grey,
                                              fontSize: 12,)),
                                      ),
                                      SizedBox(
                                        height: ScreenUtil.getInstance().setHeight(30),

                                      ),
                                      Text("Mot de Passe", style: TextStyle(
                                        fontSize: ScreenUtil.getInstance().setSp(26),
                                        fontFamily: "Poppins-Meduim",)),
                                      TextFormField(
                                        // validator: (val)=> val.length<6 ? 'Entrer une mot de passe valide ': null ,
                                        onChanged: (val){
                                          setState(()=> password=val);

                                        },
                                        obscureText: true
                                        ,
                                        decoration: InputDecoration(
                                            hintText: "Saisir votre Mot de passe ",
                                            hintStyle: TextStyle(color: Colors.grey,
                                              fontSize: 12,)),
                                      ),
                                      SizedBox(
                                        height: ScreenUtil.getInstance().setHeight(35),

                                      ),

                                      Row(

                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          InkWell(
                                            onTap: () { Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext) => new ResetPassword()));},
                                            child: Text("Mot de Passe Oublié?",
                                                style: TextStyle(
                                                  color: Colors.deepPurple,
                                                  fontSize: ScreenUtil.getInstance()
                                                      .setSp(28),
                                                  fontFamily: "Poppins-Meduim",)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),


                              ),
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(40),

                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(

                                    children: <Widget>[
                                      SizedBox(
                                        width: 12.0,
                                      ),
                                      GestureDetector(
                                        onTap: _radio,
                                        child: radioButton(_isSelected),

                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Text(
                                        "souviens de moi", style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "Poppins-Meduim",),
                                      )
                                    ],
                                  ),
                                  InkWell(
                                      child: Container(
                                        width: ScreenUtil.getInstance().setWidth(330),
                                        height: ScreenUtil.getInstance().setHeight(100),
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: [
                                                  Color(0xF818181),
                                                  Color(0XFF6078ea),
                                                ]
                                            ),
                                            borderRadius: BorderRadius.circular(6.0),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color(0XFF6078ea).withOpacity(
                                                      .3),
                                                  offset: Offset(2.0, 8.0),
                                                  blurRadius: 8.0


                                              )

                                            ]
                                        ),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () async {
                                              if(_formkey.currentState.validate()){
                                                setState(() => loading=true);
                                                dynamic result=await _auth.SingWithEmailAndPassword(email, password);
                                                if(result== null)
                                                {
                                                  setState(() => loading=false);

                                                  Show.yesAbortDialog(context, "Mot de passe ou email invalide", "Essayez de nouveau?");
                                                }
                                                else
                                                {
                                                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext) => new Home()));

                                                }

                                              }
                                            },
                                            child: Center(child: Text(
                                              "Se Connecter ", style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontFamily: "Poppins-Bold",

                                                letterSpacing: 1.0),

                                            )
                                            ),
                                          ),

                                        ),

                                      )
                                  )


                                ],
                              ),
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(40),

                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  horizontalLine(),
                                  Text("Rejoignez-nous: ", style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Poppins-Bold",

                                      letterSpacing: .6),
                                  ),
                                  horizontalLine(),
                                  SizedBox(
                                    height: ScreenUtil.getInstance().setHeight(40),

                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(40),

                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Nouvel utilisateur ?  ", style: TextStyle(

                                      fontFamily: "Poppins-Bold")
                                  ),
                                  InkWell(
                                    onTap: () =>
                                        Navigator.of(context).push(
                                            new MaterialPageRoute(builder: (
                                                BuildContext) => new SignUp())),
                                    child:
                                    Text("S'inscrire  ", style: TextStyle(
                                        color: Color(0xFF5d74e3),

                                        fontFamily: "Poppins-Bold")
                                    ),
                                  )
                                ],

                              ),
                            ]
                        ),
                      )
                  ),
                ]),



          ],
        ),

      );

  }
  String get mail  {
    return email;
  }


}