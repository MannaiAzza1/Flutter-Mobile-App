import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class FormCard extends StatelessWidget
{
  Widget horizontalLine() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      width: ScreenUtil.getInstance().setWidth(140),
      height: 1.0,
      color: Colors.purple.withOpacity(.2),
    ),
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //String _email ,_password;
    //final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
    return new Container(
      //key: _formkey,

      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(500),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0,15.0),
                blurRadius: 15.0),
            BoxShadow(

                color: Colors.black12,
                offset: Offset(0.0,15.0),
                blurRadius: 15.0)
          ]
      ),
      child:
      Padding(
        padding: EdgeInsets.only(left:16.0,right: 16.0,top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Authentification" , style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(45),
                fontFamily: "Poppins-Bold",
                letterSpacing: .6
            )
            ),
            SizedBox(

              height: ScreenUtil.getInstance().setHeight(30),


            ),
            Text("Votre ID " , style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(26),
              fontFamily: "Poppins-Meduim",)),
            TextFormField(
              //validator:(input) {
                //if (input.isEmpty) {
                  //return "Saisir votre email SVP.";
                //}
              //},
              //onSaved: (input) => _email=input,
              obscureText: false
              ,
              decoration: InputDecoration (
                  hintText: "Saisir votre ID ",
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
              //validator:(input) {
                //if (input.length<7) {
                  //return "Saisir une mot de passe valide SVP.";
                //}
              //},
              //onSaved: (input) => _password=input,
              obscureText: true
              ,
              decoration: InputDecoration (
                  hintText: "Saisir votre Mot de passe ",
                  hintStyle: TextStyle(color: Colors.grey,
                    fontSize: 12 ,)),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(35),

            ),
            Row (

              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child : Text("Mot de Passe Oublié?" , style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: ScreenUtil.getInstance().setSp(28),
                    fontFamily: "Poppins-Meduim",)),
                )
              ],
            )
          ],
        ),
      ),


    );



  }

}