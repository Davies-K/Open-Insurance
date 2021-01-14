import 'package:flutter/material.dart';
import 'package:pro007/Constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home.dart';
import 'login.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    // check for login credentials
    SharedPreferences.getInstance().then((preferences) {
      bool keyCode = preferences.getBool('isLoggedIn');

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  keyCode == null || !keyCode ? Login() : Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
