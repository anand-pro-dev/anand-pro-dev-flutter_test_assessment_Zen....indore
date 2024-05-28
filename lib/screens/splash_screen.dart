import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:working_app/screens/home_screen.dart';
import 'package:working_app/screens/login_screen.dart';

import '../widgets/utils/snak_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //

  @override
  void initState() {
    super.initState();
    gotoScreen();
  }

  gotoScreen() async {
    // Check if token is available in SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? "";

    if (token.isEmpty || token == null) {
      Timer(
          Duration(seconds: 3),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginScreen())));
    } else {
      Timer(
          Duration(seconds: 3),
          () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen())));
      Utils().snackBar("Login Sucessfully", context, color: Colors.green);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.asset(
          'assets/images/449446537.png',
          fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
