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
            'Help',
            style: GoogleFonts.pacifico(),
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 40.0),),
                ListTile(
                  title: Text('How to login?',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  subtitle: Text(
                      'You can use your mail to Sign-in or Register to Pyxy.',
                      style: TextStyle(color: Colors.grey[800], fontSize: 14)),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10.0),),
                Divider(color: Colors.black,endIndent: 10,indent: 10,thickness: 1,),
                Padding(padding: EdgeInsets.only(top: 10.0),),
                ListTile(
                  title: Text('Search Movie',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  subtitle: Text(
                      'Any movie name can be searched from the search page'
                      'the movie name list will be displayed',
                      style: TextStyle(color: Colors.grey[800], fontSize: 14)),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10.0),),
                ListTile(
                  title: Text('Movie Details',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  subtitle: Text(
                      ''
                      'Form the the list when a movie is selected the revies of the movie will be displayed ',
                      style: TextStyle(color: Colors.grey[800], fontSize: 14)),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10.0),),
                ListTile(
                  title: Text('WatchList',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      )),
                  subtitle: Text('A watch list is a users movie list preference.'
                      'The user is able to add a users own rating to the selected movie',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 14
                      )) ,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10.0),),
                ListTile(
                  title: Text('Remove from WatchList',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      )),
                  subtitle: Text('Movies can be removed from WatchList.',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 14
                      )) ,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10.0),),
                Divider(color: Colors.black,endIndent: 10,indent: 10,thickness: 1,),
                Padding(padding: EdgeInsets.only(top: 10.0),),
                ListTile(
                  title: Text('Rate Us',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  subtitle: Text(
                      'To rate us you could go to the about us page and click the link given for Facebook and reate us!',
                      style: TextStyle(color: Colors.grey[800], fontSize: 14)),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10.0),),
                ListTile(
                  title: Text('Conatact Us',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  subtitle: Text(
                      'To give any suggestions or comments please contact us with the email address given in the about us  page!',
                      style: TextStyle(color: Colors.grey[800], fontSize: 14)),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10.0),),
                Divider(color: Colors.black,endIndent: 10,indent: 10,thickness: 1,),
                Padding(padding: EdgeInsets.only(top: 10.0),),
                Text('@ 2020 Pyxy Inc.')
              ],
            )
          ],
        ),
      );
}
