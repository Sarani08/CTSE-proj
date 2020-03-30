import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'splash_screen.dart';
import 'navigation.dart';
import 'playListPage.dart';

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomeScreen(),
  "/playList": (context) => PlayListHomePage(),
};

void main() => runApp(new MaterialApp(
    theme:
        ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: routes));