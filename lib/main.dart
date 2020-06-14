import 'package:app/Services/auth.dart';
import 'package:app/Widgets/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Services/User.dart';
import 'Widgets/FormCard.Dart';
import 'Widgets/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Widgets/Dialogs2.dart';
import 'Widgets/Wrapper.dart';
import 'Widgets/loading.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    

    return StreamProvider<User>.value(
      value: AuthService().user,

      child: MaterialApp(
          home: Wrapper(),
      debugShowCheckedModeBanner: false,
      ),
    );
  }

}

