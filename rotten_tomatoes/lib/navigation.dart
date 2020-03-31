import 'package:flutter/material.dart';

class MyNavigator {
  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, "/home");
  }

  static void goToPlayList(BuildContext context) {
    Navigator.pushNamed(context, "/playList");
  }

  static void goToHelp(BuildContext context) {
    Navigator.pushNamed(context, "/help");
  }

  static void goToSearch(BuildContext context) {
    Navigator.pushNamed(context, "/search");
  }

  static void goToLoginRegisterWelcome(BuildContext context) {
    Navigator.pushNamed(context, "/loginRegisterWelcome");
  } 
}