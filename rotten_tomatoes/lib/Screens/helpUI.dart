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
                  title: Text('Watch List',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      )),
                  subtitle: Text('User has to be logged in to the application in order to use the watch list.The items can then be added using the + icon in movie detailes page.',
                  style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 14
                      )) ,
                ),
                Divider(color: Colors.black,endIndent: 10,indent: 10,),
                ListTile(
                  title: Text('Delete item from Watch List',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      )),
                  subtitle: Text('User can always delete items in watch list using delete icon in watch list.',
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
