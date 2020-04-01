import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotten_tomatoes/navigation.dart';

class SearchUI extends StatefulWidget {
  @override
  _SearchUIState createState() => _SearchUIState();
}

class _SearchUIState extends State<SearchUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
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
          "Discover",
          style: GoogleFonts.pacifico(),
        ),
      ),
        );
  }


}
