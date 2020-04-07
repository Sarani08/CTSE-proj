import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../navigation.dart';

class Help extends StatelessWidget {
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
          'Help',
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
                        padding: EdgeInsets.only(top: 30.0),
                      ),
                ListTile(
                  title: Text('Signing Up',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      )),
                  subtitle: Text('You can use your gmail to sign in to Pyxy.',
                  style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 14
                      )) ,
                ),
                Divider(color: Colors.black,endIndent: 10,indent: 10,),
                ListTile(
                  title: Text('Prefernece List',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      )),
                  subtitle: Text('User has to be logged in to the application in order to use the preference list.The items canthen be added using the + icon in movie detailes page.',
                  style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 14
                      )) ,
                ),
                Divider(color: Colors.black,endIndent: 10,indent: 10,),
                ListTile(
                  title: Text('Delete item from Preference List',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      )),
                  subtitle: Text('User can always delete items in prefernce list using delete icon in preference list.',
                  style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 14
                      )) ,
                ),
                Divider(color: Colors.black,endIndent: 10,indent: 10,),
                SizedBox(
                  height: 15.0,
                ),
              ],
            )
          ],
        ),
      );
}
