import 'package:flutter/material.dart';
import 'package:rotten_tomatoes/Services/auth.dart';

class MyNavigator {
  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, "/home");
  }

  static void goToWatchList(BuildContext context) {
    Navigator.pushNamed(context, "/watchList");
  }

  static void goToHelp(BuildContext context) {
    Navigator.pushNamed(context, "/helpUI");
  }

  static void goToSearch(BuildContext context) {
    Navigator.pushNamed(context, "/search");
  }

  static void goToLoginRegisterWelcome(BuildContext context, Auth auth) {
    Navigator.pushNamed(context, "/loginRegisterWelcome", arguments : auth);
  } 
  
  static void goToMovieDtails(BuildContext context){
    Navigator.pushNamed(context, "/movieDetails");
  }

  static void goToAboutUs(BuildContext context){
    Navigator.pushNamed(context, "/aboutUs");
  }

  static void goToRoot(BuildContext context, Auth auth){
    Navigator.pushNamed(context, "/root", arguments : auth);
  }

}