
import 'package:flutter/material.dart';
import 'package:rotten_tomatoes/Screens/aboutUs.dart';
import 'package:rotten_tomatoes/Screens/root_page.dart';
import 'home_screen.dart';
import 'splash_screen.dart';
import 'Screens/playListPage.dart';
import 'Screens/helpUI.dart';
import 'Screens/searchUI.dart';
import 'Services/auth.dart';
import 'Screens/userProfile.dart';
import 'Screens/aboutUs.dart';
import 'Screens/helpUI.dart';


var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomeScreen(),
  "/playList": (context) => PlayListView(),
  "/search" : (context) => Search(),
  "/userProfile" : (context) => UserProfile(),
  "/aboutUs" : (context) => About(),
  "/helpUI" : (context) => Help(),
  "/root" : (context) => RootPage(auth: Auth(),)
};

void main() {
 WidgetsFlutterBinding.ensureInitialized();


  runApp (
    new MaterialApp(
      theme:
          ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: routes),
  );
}