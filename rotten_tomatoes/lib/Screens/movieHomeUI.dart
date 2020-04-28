/* This page is the Home page of the Pyxy application.This calls list of movies from the movie api nytimes.com
Referred tutorials on building this :
1.https://blog.codeminer42.com/build-your-first-app-with-flutter-getting-data-from-api-c9fb4c2a6812/
  */

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'movieDetailsUI.dart';
import 'package:google_fonts/google_fonts.dart';
import '../navigation.dart';

class MovieHomeUI extends StatefulWidget {
  @override
  _MovieHomeUIState createState() => _MovieHomeUIState();
}

class _MovieHomeUIState extends State<MovieHomeUI> {

  Map data;
  List userData;
  String title;

  //calling the nytimes movie api to load movies.
  Future getData() async {
    http.Response response = await http.get("https://api.nytimes.com/svc/movies/v2/reviews/all.json?&api-key=kq71eQPzi5qiOMAHNNc8aTOiBrYkvYWL");
    data = json.decode(response.body);
    setState(() {
      userData = data["results"];
    });
  }

  @override
  void initState() {
    super.initState();
    //loading movies in the intialized state
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          'Home',
          style: GoogleFonts.pacifico(),
        ),
      ),
      //showing list of movies returned from API using a ListView
      body: ListView.builder(
        padding: const EdgeInsets.all(10.0) ,
        itemCount: userData == null ? 0 : userData.length,
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
            child: new Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ListTile(
                    title: Text("${userData[index]["display_title"]}",
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Text("${userData[index]["headline"]}"),
                    trailing: Text("${userData[index]["critics_pick"]}", style: TextStyle(color: Colors.red),),
                    leading: Image.network(userData[index]["multimedia"]["src"]),

                  ),
                ],),
            ),

            onTap: () {


              String title = userData[index]["display_title"];
              String imageURl = userData[index]["multimedia"]["src"];
              int critics = userData[index]["critics_pick"];
              String summary = userData[index]["summary_short"];
              String date = userData[index]["publication_date"];
              String author = userData[index]["byline"];
              int id = index;

              //Navigate to movie detail page once movie is clicked
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context){
                    return new MovieDetailUI(imageURl ,title,summary,date,author,critics,id);
                  }));
            },
          );
        },
      ),
    );
  }

}