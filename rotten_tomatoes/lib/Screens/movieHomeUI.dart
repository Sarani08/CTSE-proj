import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:rotten_tomatoes/navigation.dart';
import 'playListApi.dart';



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
                        subtitle: Text("${userData[index]["summary_short"]}"),
                        trailing: Text("${userData[index]["critics_pick"]}", style: TextStyle(color: Colors.red),),
                        leading: Image.network(userData[index]["multimedia"]["src"]),
                                              
                      ),          
                    ],),
                ),

                onTap: () {
                  api.addToList(userData[index]["display_title"],userData[index]["multimedia"]["src"]);
                  MyNavigator.goToPlayList(context);
                },
              );
          },
      ),
    );
  }
  
}
