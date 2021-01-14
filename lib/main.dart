import 'package:flutter/material.dart';
import 'package:pro007/Constants/constants.dart';
import 'package:pro007/screens/Auth/login.dart';
import 'package:pro007/screens/Auth/signup.dart';
import 'package:pro007/screens/home.dart';
import 'package:pro007/screens/timeline.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/Auth/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insurance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: primarycolor
         
      ),
      home: Splash(),
    );
  }
}
