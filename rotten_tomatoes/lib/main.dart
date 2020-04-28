
import 'package:flutter/material.dart';
import 'package:rotten_tomatoes/Screens/aboutUs.dart';
import 'package:rotten_tomatoes/Screens/root_page.dart';
import 'home_screen.dart';
import 'splash_screen.dart';
import 'Screens/watchListPage.dart';
import 'Screens/helpUI.dart';
import 'Screens/searchUI.dart';
import 'Services/auth.dart';
import 'Screens/userProfile.dart';
import 'Screens/aboutUs.dart';

//routes used in Pyxy application
var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomeScreen(),
  "/watchList": (context) => WatchListView(),
  "/search" : (context) => Search(),
  "/userProfile" : (context) => UserProfile(),
  "/aboutUs" : (context) => About(),
  "/helpUI" : (context) => Help(),
  "/root" : (context) => RootPage(auth: Auth(),)
};

void main() {
 //call this method if you need the binding to be initialized before calling runApp.
 WidgetsFlutterBinding.ensureInitialized();


  runApp (
    new MaterialApp(
      theme:
          ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
      debugShowCheckedModeBanner: false,
      //call splashscreen before home screen pops up
      home: SplashScreen(),
      routes: routes),
  );
}