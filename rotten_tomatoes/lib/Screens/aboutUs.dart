/*
      This page includes the details of the creators as well as contacting social
      media links.
      References:
      1. https://pub.dev/packages/url_launcher
*/

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                //navigate to help page
                MyNavigator.goToHelp(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () {
                //navigate to app information page
                MyNavigator.goToAboutUs(context);
              },
            ),
          ],
          title: Text(
            'About Us',
            style: GoogleFonts.pacifico(),
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 100.0),
                ),
                Center(
                  child: Image.asset(
                    'assets/logo.JPG', //logo image
                    alignment: Alignment.center,
                    height: 150.0,
                    width: 150.0,
                  ),
                ),
                ListTile(
                  title: Text(
                    "version 1.0.0",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 100),
                  leading: Icon(
                    FontAwesomeIcons.github,
                    color: Colors.redAccent,
                    size: 50,
                  ),
                  title: Text(
                    'View Us on GitHub',
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                  onTap: () => _launchURL(), //launch github
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 100),
                  leading: Icon(
                    FontAwesomeIcons.facebookSquare,
                    color: Colors.redAccent,
                    size: 50,
                  ),
                  title: Text('Like us on Facebook',
                      style: TextStyle(
                        color: Colors.grey[800],
                      )),
                  onTap: () => url_launcher
                      .launch('https://www.facebook.com/'), //launch facebook
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 100),
                  leading: Icon(
                    FontAwesomeIcons.google,
                    color: Colors.redAccent,
                    size: 50,
                  ),
                  title: Text('Email Us',
                      style: TextStyle(
                        color: Colors.grey[800],
                      )),
                  onTap: () => url_launcher
                      .launch('https://www.gmail.com/'), //launch gmail
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

// launch and navigate to the github repo link when github option is clicked
_launchURL() async {
  const url = 'https://github.com/Sarani08/CTSE-proj';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
