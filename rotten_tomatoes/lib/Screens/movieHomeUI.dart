import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'file:///C:/Users/rusnlk/Desktop/sliit/4y1s/CTSE/CTSE-proj/rotten_tomatoes/lib/Screens/playListApi.dart';
import 'package:rotten_tomatoes/navigation.dart';



class MovieHomeUI extends StatefulWidget {
  @override
  _MovieHomeUIState createState() => _MovieHomeUIState();
}

class _MovieHomeUIState extends State<MovieHomeUI> {

  Map data;
  List userData;
  PlayListApi api = new PlayListApi();

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
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: userData == null ? 0 : userData.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    // CircleAvatar(
                    //   backgroundImage: NetworkImage(userData[index]["multimedia"]["src"]),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("${userData[index]["display_title"]}",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: IconButton(
                        icon: Icon(Icons.playlist_add),
                        onPressed: () {
                          api.addToList(userData[index]["display_title"],userData[index]["multimedia"]["src"]);
                          MyNavigator.goToPlayList(context);
                        },

                      )
                    ),
                  ],
                ),
              ),
            );
          },
      ),
    );
  }
}
