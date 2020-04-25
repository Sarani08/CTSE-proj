
import 'package:flutter/material.dart';
import 'package:rotten_tomatoes/Screens/aboutUs.dart';
import 'home_screen.dart';
import 'splash_screen.dart';
import './Screens/LoginSignUpWelcome.dart';
import 'Screens/playListPage.dart';
import 'Screens/helpUI.dart';
import 'Screens/searchUI.dart';
import 'Screens/RegisterUI.dart';
import 'package:provider/provider.dart';
import 'Services/auth.dart';
import 'models/user.dart';
import 'Screens/userProfile.dart';
import 'Screens/aboutUs.dart';
import 'Screens/helpUI.dart';


var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomeScreen(),
  "/playList": (context) => PlayListView(),
  "/loginRegisterWelcome": (context) => LoginSignUPWelcome(),
  "/search" : (context) => Search(),
  "/register" : (context) => SignupPage(),
  "/userProfile" : (context) => UserProfile(),
  "/aboutUs" : (context) => About(),
  "/helpUI" : (context) => Help(),
};

void main() {
WidgetsFlutterBinding.ensureInitialized();
 runApp(
  StreamProvider<User>.value(
    value: AuthService().user,
      child: new MaterialApp(
      theme:
          ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: routes),
  ));
}