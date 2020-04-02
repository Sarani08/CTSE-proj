
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'splash_screen.dart';
import 'Screens/playListPage.dart';
import 'Screens/LoginSignUpWelcome.dart';
import 'Screens/searchUI.dart';
import 'Screens/RegisterUI.dart';
import 'Screens/movieDetailsUI.dart';


var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomeScreen(),
  "/playList": (context) => PlayListView(),
  "/loginRegisterWelcome": (context) => LoginSignUPWelcome(),
//  "/help" : (context) => HelpUI(),
  "/search" : (context) => SearchUI(),
  "/register" : (context) => SignupPage(),
};

void main() => runApp(new MaterialApp(
    theme:
        ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes));