import 'package:flutter/material.dart';
import 'package:rotten_tomatoes/Services/auth.dart';

class MyNavigator {
  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, "/home");
  }

  static void goToPlayList(BuildContext context) {
    Navigator.pushNamed(context, "/playList");
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

  static void goToRegister(BuildContext context){
    Navigator.pushNamed(context, "/register");
  }

  static void goToMovieDtails(BuildContext context){
    Navigator.pushNamed(context, "/movieDetails");
  }

  static void goToUserProfile(BuildContext context){
    Navigator.pushNamed(context, "/userProfile");
  }

  static void goToAboutUs(BuildContext context){
    Navigator.pushNamed(context, "/aboutUs");
  }

  static void goToRoot(BuildContext context, Auth auth){
    Navigator.pushNamed(context, "/root", arguments : auth);
  }

}