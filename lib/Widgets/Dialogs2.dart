import 'package:app/Widgets/SignUp.dart';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
enum DialogAction{ yes , abort

}
class Show{
  static Future<DialogAction> yesAbortDialog(
      BuildContext context,
      String Title,
      String Body
      )
  async{
    final action= await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),

            ),
            title: Text(Title),
            content:  Text(Body),
            actions: <Widget>[

              FlatButton(
                onPressed: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext) => new MyApp())),
                child: const Text('OK'),

              ),

            ],

          );
        }

    );
  }
}