import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'splash_screen.dart';
import 'playListPage.dart';
import './Screens/LoginSignUpWelcome.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomeScreen(),
  "/playList": (context) => PlayListView(),
  "/loginRegisterWelcom": (context) => LoginSignUPWelcome(),

};

void main() => runApp(new MaterialApp(
    theme:
        ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes));