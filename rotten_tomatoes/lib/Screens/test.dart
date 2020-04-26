import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../navigation.dart';

class DrawerUI extends StatefulWidget {
  @override
  _DrawerUIState createState() => _DrawerUIState();
}

TabController controller;

class _DrawerUIState extends State<DrawerUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                MyNavigator.goToHome(context);
              },
            ),
            ListTile(
              title: Text('My Account'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                MyNavigator.goToLoginRegisterWelcome(context);
              },
            ),
            ListTile(
              title: Text('My PlayList'),
              onTap: () {
                MyNavigator.goToPlayList(context);
              },
            ),
            ListTile(
              title: Text('My Userprof'),
              onTap: () {
                MyNavigator.goToUserProfile(context);
              },
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                MyNavigator.goToAboutUs(context);
              },
            ),
          ],
        ),
      ),
    );
  }


}