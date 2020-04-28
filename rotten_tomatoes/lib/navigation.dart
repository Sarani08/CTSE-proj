/* This file handles the navigation throughout the application by calling into defined routes in main.dart */

import 'package:flutter/material.dart';
import 'package:rotten_tomatoes/Services/auth.dart';

class MyNavigator {
  //navigate to Movie Home page
  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, "/home");
  }

  //navigate to Watchlist page
  static void goToWatchList(BuildContext context) {
    Navigator.pushNamed(context, "/watchList");
  }

  //navigate to Help page
  static void goToHelp(BuildContext context) {
    Navigator.pushNamed(context, "/helpUI");
  }

  //navigate to search page
  static void goToSearch(BuildContext context) {
    Navigator.pushNamed(context, "/search");
  }

  //navigate to Movie Details page
  static void goToMovieDtails(BuildContext context){
    Navigator.pushNamed(context, "/movieDetails");
  }

  //navigate to About us page
  static void goToAboutUs(BuildContext context){
    Navigator.pushNamed(context, "/aboutUs");
  }

  //navigate to root page
  static void goToRoot(BuildContext context, Auth auth){
    Navigator.pushNamed(context, "/root", arguments : auth);
  }

}