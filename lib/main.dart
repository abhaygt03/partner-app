import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:partner/Profile.dart';

import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:LoginScreen(),
      routes: <String,WidgetBuilder>{
        '/Profile':(context)=>ProfilePage(),
      },
    );
  }
}           