import 'package:flutter/material.dart';

class MyNavigator {
  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, "/home");
  }

  static void goToPlayList(BuildContext context) {
    Navigator.pushNamed(context, "/playList");
  }

  static void goToLoginRegisterWelcome(BuildContext context) {
    Navigator.pushNamed(context, "/loginRegisterWelcome");
  } 
}