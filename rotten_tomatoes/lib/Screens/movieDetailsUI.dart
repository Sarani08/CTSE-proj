/*Extensive information about a movie can be seen using this page.
Looked this tutorial https://medium.com/@anujguptawork/flutter-hands-on-building-a-movie-listing-app-using-flutter-part-2-movie-detail-page-12ef9c7e95cc to get an 
idea on the UI
 */

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:google_fonts/google_fonts.dart';
import 'package:rotten_tomatoes/navigation.dart';
import 'watchListApi.dart';


class MovieDetailUI extends StatelessWidget {
  String imageURL;
  String movieName;
  String summary;
  int criticsPick;
  String date;
  String author;
  int id;
  WatchListApi api = new WatchListApi();


  MovieDetailUI(this.imageURL,this.movieName,this.summary,this.date,this.author,this.criticsPick, this.id);
  Color mainColor = const Color(0xff3C3261);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
          this.movieName,
          style: GoogleFonts.pacifico(),
        ),
      ),
      //setting background image
      body: new Stack(fit: StackFit.expand, children: [
        new Image.network(
          imageURL,
          fit: BoxFit.cover,
        ),
        new BackdropFilter(
          filter: new ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: new Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        new SingleChildScrollView(
          child: new Container(
            margin: const EdgeInsets.all(20.0),
            child: new Column(
              children: <Widget>[
                new Container(
                  alignment: Alignment.center,
                  child: new Container(
                    width: 300.0,
                    height: 300.0,
                  ),
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(10.0),
                      image: new DecorationImage(
                          image: new NetworkImage(
                              imageURL),
                          fit: BoxFit.cover),
                      boxShadow: [
                        new BoxShadow(
                            color: Colors.black,
                            blurRadius: 20.0,
                            offset: new Offset(0.0, 10.0))
                      ]),
                ),
                new Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 0.0),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                          child: new Text(
                            movieName,
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontFamily: 'Arvo'),
                          )),
                      new Text(
                        'Critics: $criticsPick',
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: 'Arvo'),
                      )
                    ],
                  ),
                ),
                new Text(author,textAlign: TextAlign.left,style: new TextStyle(color: Colors.white, fontFamily: 'Arvo', fontSize: 15)),
                new Text('onAir: $date',textAlign: TextAlign.left,style: new TextStyle(color: Colors.white, fontFamily: 'Arvo', fontSize: 15)),
                new Padding(padding: const EdgeInsets.all(12.0)),
                new Text(summary,style: new TextStyle(color: Colors.white, fontFamily: 'Arvo')),
                new Padding(padding: const EdgeInsets.all(12.0)),
                new Container (
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.add,
                    ),
                    onPressed: (){
                      //adding relevant movie to wacthlist and navigating to watchlist
                      api.addToList(movieName,criticsPick,id,imageURL,0.25);
                      MyNavigator.goToWatchList(context);
                    },
                    tooltip: 'Add to preferences',
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}