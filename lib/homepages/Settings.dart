import 'package:app/Services/User.dart';
import 'package:app/Services/database.dart';
import 'package:app/bloc/navigation/bloc/navigation_bloc.dart';
import 'package:app/homepages/updateForm.dart';
import 'package:app/homepages/updateFormEmail.dart';
import 'package:app/homepages/updateFormID.dart';
import 'package:app/homepages/updateFormPhone.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Settings extends StatelessWidget with NavigationStates{
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    void _showSettingsPanel( ){
      showModalBottomSheet(context: context, builder: (context)
      {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 60),
          child: SettingsForm(),

        );

      });



    };
    void _showSettingsPanelID( ){
      showModalBottomSheet(context: context, builder: (context)
      {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 60),
          child: SettingsFormID(),

        );

      });


    };
    void _showSettingsPanelPhone( ){
      showModalBottomSheet(context: context, builder: (context)
      {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 60),
          child: SettingsFormPhone(),

        );

      });


    };
    void _showSettingsPanel_email( ){
      showModalBottomSheet(context: context, builder: (context)
      {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 60),
          child: SettingsFormEmail(),

        );

      });




    };

          return Scaffold(


            body: SingleChildScrollView(
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: Text("Paramètres", style: TextStyle(
                        color: Color(0xFF4C516D), fontSize: 30),),
                  ),

                  SizedBox(height: 80, width: 20),
                  Card(
                    margin: const EdgeInsets.all(10.0),
                    color: Color(0xFF4C516D),
                    child: ListTile(



                    ),
                  ),

                  const SizedBox(
                    height: 2.0,

                  ),
                  Card(
                    margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                    elevation: 8.0,

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),

                    child: Column(
                      children: <Widget>[

                        ListTile(
                          leading: Icon(Icons.vpn_key,  color: Color(
                              0xFF4C516D),),
                          title: Text("Changer mot de passe"),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () => _showSettingsPanel(),

                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          width: double.infinity,
                          height: 1.0,
                          color: Colors.grey.shade400,
                        ),
                        ListTile(
                          leading: Icon(Icons.alternate_email, color: Color(
                              0xFF4C516D),),
                          title: Text("Changer Adresse email"),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () => _showSettingsPanel_email(),

                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          width: double.infinity,
                          height: 1.0,
                          color: Colors.grey.shade400,
                        ),
                        ListTile(
                          leading: Icon(Icons.phone, color: Color(0xFF4C516D),),
                          title: Text("Changer Telephone"),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () => _showSettingsPanelPhone(),


                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          width: double.infinity,
                          height: 1.0,
                          color: Colors.grey.shade400,
                        ),
                        ListTile(
                          leading: Icon(Icons.lock_outline, color: Color(
                              0xFF4C516D),),
                          title: Text("Changer votre ID"),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () => _showSettingsPanelID(),

                        ),
                      ],
                    ),
                  ),


                ],

              ),
            ),

          );

  }
}
