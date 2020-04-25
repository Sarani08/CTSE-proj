import 'package:flutter/material.dart';
import '../navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
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
    setState(() {
      _searching = true;
    });

    // Algolia algolia = Algolia.init(
    //   applicationId: 'APP_ID',
    //   apiKey: 'SEARCH_API_KEY',
    // );

    // AlgoliaQuery query = algolia.instance.index('Posts');
    // query = query.search(_searchText.text);

    // _results = (await query.getObjects()).hits;

    print(_searchText);
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
              MyNavigator.goToHelp(context);
            },
          ),
        ],
        title: Text(
          'Discover',
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
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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