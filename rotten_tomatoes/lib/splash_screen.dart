/* Splah screen before home screen pops up */
import 'dart:async';

import 'package:flutter/material.dart';
import 'navigation.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //Load home page after 3 seconds of the splash screen
    Timer(Duration(seconds: 3), () => MyNavigator.goToHome(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white70),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 100.0),
                      ),
                      //Pyxy logo
                      Image.asset(
                        "assets/logo.JPG",
                        height: 300,
                        width: 300,
                        fit: BoxFit.fill,                     
                        
                      )
                      ,
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(backgroundColor: Colors.red,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    //Loading in progress for 3 seconds
                    Text(
                     "Loading in progress ...",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontStyle: FontStyle.italic ,
                          fontSize: 12.0,
                          color: Colors.redAccent),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}