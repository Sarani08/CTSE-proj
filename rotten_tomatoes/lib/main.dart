import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'splash_screen.dart';
import 'Screens/playListUI.dart';
import 'Screens/helpUI.dart';
import 'Screens/searchUI.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomeScreen(),
  "/playList": (context) => PlayListView(),
  "/help" : (context) => HelpUI(),
  "/search" : (context) => SearchUI(),
};

void main() => runApp(new MaterialApp(
    theme:
        ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes));