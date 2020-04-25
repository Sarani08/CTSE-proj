import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../navigation.dart';
import './drawer.dart';

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
      drawer: CommonDrawer(),  
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
