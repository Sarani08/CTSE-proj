import 'package:flutter/material.dart';
import 'package:rotten_tomatoes/navigation.dart';

class HelpUI extends StatefulWidget {
  @override
  _HelpUIState createState() => _HelpUIState();
}

class _HelpUIState extends State<HelpUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(
        "Help",
      ),
    ));
  }
}
