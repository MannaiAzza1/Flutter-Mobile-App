
import 'package:app/Services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/Widgets/Dialogs.dart';
import 'package:app/Services/User.dart';

import 'loading.dart';
class SignUp extends StatefulWidget {
  @override
  _SingUpState createState() =>_SingUpState();

}




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
  class _SingUpState extends State<SignUp>
  {
    String password='' ;
    String email='';
    String id="";
    String num="";



  String error='';
    final AuthService _auth = AuthService();
    bool loading=false;
    final useriD = FirebaseAuth.instance.currentUser();
    final _formkey=GlobalKey<FormState>();
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()
      ..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 700, height: 1000, allowFontScaling: true);
    return loading? Loading():Scaffold(
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
                    child: Container(


                    ),

                  ),
                  //Image.asset("assets/image.png"),


                ],


              ),


                    Form(
                    key: _formkey,



                        child : Padding(
                            padding: EdgeInsets.only(left:28.0,right: 28.0,top :60.0),

                            child:ListView(
                              children: [ Column
                                (
                                  children: <Widget>[
                                    Row(

                                      children: <Widget>[Image.asset("", width: ScreenUtil.getInstance().setWidth(150) , height: ScreenUtil.getInstance().setHeight(100),)],
                                    ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance().setHeight(10),

                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 440,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(8.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              offset: Offset(0.0,15.0),
                                              blurRadius: 15.0,

                                            ),

                                            BoxShadow(
                                                color: Colors.black12,
                                                offset: Offset(0.0,15.0),
                                                blurRadius: 15.0),

                                          ]


                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(left:16.0,right: 16.0,top: 16.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text("S'inscrire" , style: TextStyle(
                                                fontSize: ScreenUtil.getInstance().setSp(45),
                                                fontFamily: "Poppins-Bold",
                                                letterSpacing: .6
                                            )
                                            ),
                                            SizedBox(
                                              height: ScreenUtil.getInstance().setHeight(30),

                                            ),
                                            Text("Saisir Une ID  " , style: TextStyle(
                                              fontSize: ScreenUtil.getInstance().setSp(26),
                                              fontFamily: "Poppins-Meduim",)),
                                            TextFormField(
                                              validator: (val)=> val.isEmpty ? 'Entrer votre ID ': null ,
                                              onChanged: (val){
                                                setState(()=> id=val);},


                                              obscureText: false
                                              ,
                                              decoration: InputDecoration (
                                                  prefixIcon: Icon(Icons.person),
                                                  hintText: " Ca sera Votre nouvelle ID",
                                                  hintStyle: TextStyle(color: Colors.grey,
                                                    fontSize: 12 ,)),

                                            ),
                                            SizedBox(
                                              height: ScreenUtil.getInstance().setHeight(30),

                                            ),
                                            Text("Mot de Passe" , style: TextStyle(
                                              fontSize: ScreenUtil.getInstance().setSp(26),
                                              fontFamily: "Poppins-Meduim",)),
                                            TextFormField(
                                              validator: (val)=> val.length<6 ? 'Entrer une mot de passe valide ': null ,
                                              onChanged: (val){
                                                setState(()=> password=val);
                                              },
                                              obscureText: true
                                              ,
                                              decoration: InputDecoration (
                                                  prefixIcon: Icon(Icons.vpn_key),
                                                  hintText: "Saisir votre Mot de passe ",
                                                  hintStyle: TextStyle(color: Colors.grey,
                                                    fontSize: 12 ,)),
                                            ),
                                            SizedBox(
                                              height: ScreenUtil.getInstance().setHeight(30),

                                            ),
                                            Text("Email" , style: TextStyle(
                                              fontSize: ScreenUtil.getInstance().setSp(26),
                                              fontFamily: "Poppins-Meduim",)),
                                            TextFormField(
                                              validator: (val)=> val.isEmpty ? 'Entrer votre Email ': null ,
                                              onChanged: (val){
                                                setState(()=> email=val);
                                              },
                                              obscureText: false
                                              ,
                                              decoration: InputDecoration (
                                                  prefixIcon: Icon(Icons.email),

                                                  hintText: "Saisir votre Adresse Email ",
                                                  hintStyle: TextStyle(color: Colors.grey,
                                                    fontSize: 12 ,))
                                              ,),

                                            SizedBox(
                                              height: ScreenUtil.getInstance().setHeight(30),

                                            ),
                                            Text("Numéro de Telephone " , style: TextStyle(
                                              fontSize: ScreenUtil.getInstance().setSp(26),
                                              fontFamily: "Poppins-Meduim",)),
                                            TextFormField(
                                              validator: (val)=> val.length<8 ? 'Saisir un numéro valide. ': null ,
                                                onChanged: (val){
                                                    setState(()=> num=val);},
                                              obscureText:  false,
                                              decoration: InputDecoration (
                                                  prefixIcon: Icon(Icons.phone),
                                                  hintText: "Saisir Numero de Telephone ",
                                                  hintStyle: TextStyle(color: Colors.grey,
                                                    fontSize: 12 ,))
                                              ,),



                                          ],
                                        ),


                                      ),

                                    ), //this is what i want
                                    SizedBox (
                                      height: ScreenUtil.getInstance().setHeight(40),

                                    ),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:<Widget> [
                                          Row(

                                              children: <Widget>[
                                                SizedBox(
                                                  width: 12.0,
                                                ),
                                              ]
                                          ),

                                          InkWell(
                                              child: Container(

                                                  width: ScreenUtil.getInstance().setWidth(380),
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
                                                            color: Color(0XFF6078ea).withOpacity(.3),
                                                            offset: Offset(10.0,10.0),
                                                            blurRadius:8.0


                                                        )

                                                      ]
                                                  ),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                      onTap: ()  async {
                                                        if(_formkey.currentState.validate()){

                                                          setState(() => loading=true);
                                                          dynamic result=await _auth.SingInWithEmail(email,password,id,num);
                                                          if(result !=null) {

                                                            Dialogs.yesAbortDialog(context, 'You have been Successfuly Singed In', ' You want to go back to the Sign In Page?');


                                                          }
                                                          else{
                                                            loading=false;
                                                            Dialogs.yesAbortDialog(context, "Error","");

                                                          }
                                                          ;
                                                        }
                                                          },


                                                      child:
                                                      Center (child: Text("Valider ",style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                          fontFamily: "Poppins-Bold",

                                                          letterSpacing: 1.0 ),


                                                      )
                                                      ),
                                                    ),



                                                  )

                                              )

                                          ),


                                        ]
                                    )
                                  ]
                              ),
                            ])
                        ),
  ),

                


            ]

        )

    );


  }




    }


