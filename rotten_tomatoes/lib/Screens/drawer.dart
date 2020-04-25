import 'package:flutter/material.dart';
import 'package:rotten_tomatoes/Services/auth.dart';
import '../navigation.dart';

class CommonDrawer extends StatelessWidget {

  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                MyNavigator.goToLoginRegisterWelcome(context, _auth);
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
      );
  }
}