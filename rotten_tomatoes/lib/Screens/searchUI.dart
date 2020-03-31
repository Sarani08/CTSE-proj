import 'package:flutter/material.dart';

class SearchUI extends StatefulWidget {
  @override
  _SearchUIState createState() => _SearchUIState();
}

class _SearchUIState extends State<SearchUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Search Movie",
          ),
        ));
  }


}
