/* This page allows a user to search a movie and get the relevant output based on the search.
User can also navigate to movie details page using the searched results.
The tutorials that were looked into are :
https://medium.com/flutterpub/implementing-search-in-flutter-17dc5aa72018
  */



import 'package:flutter/material.dart';
import '../navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'movieDetailsUI.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchText = TextEditingController(text: "");
  List userData = [];
  Map data;  
  bool _searching = false;

  _search() async {
    //track searching to show mesage Searching,please wait ...
    setState(() {
      _searching = true;
    });

    //search based on the user input from nytimes.com api
    http.Response response = await http.get("https://api.nytimes.com/svc/movies/v2/reviews/search.json?query=${_searchText.text}&api-key=kq71eQPzi5qiOMAHNNc8aTOiBrYkvYWL");
    data = json.decode(response.body);
    setState(() {
      _searching = false;
      userData = data["results"];

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Discover',
          style: GoogleFonts.pacifico(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //enter search query and press search button
          children: <Widget>[
            Text("Search"),
            TextField(
              controller: _searchText,
              decoration: InputDecoration(hintText: "Search query here..."),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  color: Colors.red,
                  child: Text(
                    "Search",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: _search,
                ),
              ],
            ),
            Expanded(
              child: _searching == true
                  ? Center(
                      child: Text("Searching, please wait..."),
                    )
                  : userData.length == 0
                      ? Center(
                          child: Text("No results found."),
                        )
                      : ListView.builder(
                          itemCount: userData == null ? 0 :userData.length,
                          itemBuilder: (BuildContext ctx, int index) {

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
                    leading: userData[index]["multimedia"] == null ? Icon(Icons.movie) : Image.network(userData[index]["multimedia"]["src"]),

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

              //Navigate to movie detail page inorder to see more details on the selected movie
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context){
                    return new MovieDetailUI(imageURl ,title,summary,date,author,critics,id);
                  }));
            },
          );
                          },
                        ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}