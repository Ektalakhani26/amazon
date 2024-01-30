// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bottombar/BottomNavigationBar.dart';
import 'CarouselScreen.dart';
import '../Pages/HomeScreen.dart';
import 'loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  static String KEYLOGIN = 'login';
  static String SPLASH = 'Carousel' ;

  @override
  void initState() {
    super.initState();
    GoToScreen();

     /*Timer(Duration(seconds: 2), () {
       Navigator.pushReplacement(
         context, MaterialPageRoute(builder: (context) => BottomBarScreen(),),
       );
   });*/


  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Center(
          child: Image(image: AssetImage('assets/images/shopy.png'),fit: BoxFit.fill),
        ),

      ),
    );
  }
  void GoToScreen() async {
    var prefs = await SharedPreferences.getInstance();
    var pref = await SharedPreferences.getInstance();
    var onboarding = pref.getBool(SPLASH);
    var loggedIn = prefs.getBool(KEYLOGIN);

    if (loggedIn != null && onboarding != null) {
      if (onboarding && loggedIn) {
        Timer(Duration(seconds: 1), () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen(),));
        });
      }
      else if (onboarding) {
        Timer(Duration(seconds: 1), () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LogInScreen(),));
        });
      }
      else {
        Timer(Duration(seconds: 1), () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => CarouselScreen(),));
        });
      }
    }
    else {
      Timer(Duration(seconds: 1), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CarouselScreen(),));
      });
    }
  }
}


