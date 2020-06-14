

import 'package:app/Services/auth.dart';
import 'package:app/Widgets/Auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Home.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => new _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final AuthService _auth = AuthService();
  bool _isSelected = false;
  String email='', password='' ;
  String role='';
  final _formkey=GlobalKey<FormState>();
  bool loading=false;

  String error;
  var _textcontroller = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  _ShowSnackBar() {
    print('message');
    final snackBar = new SnackBar(

      content: new Text("An email have been sent to $email"),
      duration: new Duration(seconds: 3),
      backgroundColor: Color(0XFF6078ea),
      action: new SnackBarAction(label:"OK",
          onPressed: (){Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext) => new Auth()));}
          ),


    );
    _scaffoldkey.currentState.showSnackBar(snackBar);
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


    return Scaffold(
      key: _scaffoldkey,

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
                                    Text("Reset Password", style: TextStyle(
                                        fontSize: ScreenUtil.getInstance().setSp(45),
                                        fontFamily: "Poppins-Bold",
                                        letterSpacing: .6
                                    )
                                    ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance().setHeight(40),

                                    ),
                                    Text("Email", style: TextStyle(
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
                                          hintText: "Saisir Votre email de récuperation ",
                                          hintStyle: TextStyle(color: Colors.grey,
                                            fontSize: 12,)),
                                    ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance().setHeight(40),

                                    ),
                                    Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
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
                                            if((_formkey.currentState.validate())){
                                             final result= FirebaseAuth.instance.sendPasswordResetEmail(email: email);
                                              if(result!=null)
                                            _ShowSnackBar();}
                                            else{
                                              print("error");

                                            }
                                            },
                                          child: Center(child: Text(
                                            "Valider ", style: TextStyle(
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

                          ]
                      ),
                    )
                ),
              ]),



                    ))],
      ),

    ]));

  }
  String get mail  {
    return email;
  }


}


