import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import '../navigation.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Scaffold(
    appBar: AppBar(
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: () {
              MyNavigator.goToHelp(context);
            },
          ),
        ],
        title: Text(
          'About Us',
          style: GoogleFonts.pacifico(),
        ),
      ),
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
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                        padding: EdgeInsets.only(top: 100.0),
                      ),
                Center(
                  child: Image.asset(
                    'assets/logo.JPG',
                    alignment: Alignment.center,
                    height: 150.0,
                    width: 150.0,
                  ),
                ),
                ListTile(
                  title: Text(
                    "About Us",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                ListTile(
                  leading: Icon(
                    FontAwesomeIcons.github,
                    color: Colors.redAccent,
                    size: 50,
                  ),
                  title: Text('Source code on GitHub',
                      style: TextStyle(
                        color: Colors.grey[800],
                      )),
                  onTap: () => _launchURL(),
                ),
                ListTile(
                  leading: Icon(
                    FontAwesomeIcons.facebookSquare,
                    color: Colors.redAccent,
                    size: 50,
                  ),
                  title: Text('Like us on Facebook',
                      style: TextStyle(
                        color: Colors.grey[800],
                      )),
                  onTap: () => url_launcher.launch('https://www.facebook.com/'),
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            )
          ],
        ),
      );
}

_launchURL() async {
  const url = 'https://github.com/Sarani08/CTSE-proj';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}