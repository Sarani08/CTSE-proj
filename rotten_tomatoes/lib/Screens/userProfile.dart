import 'package:flutter/material.dart';
import 'package:rotten_tomatoes/Services/auth.dart';
import 'package:rotten_tomatoes/models/user.dart';
import 'dart:ui' as ui;
import '../navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import './drawer.dart';


class UserProfile extends StatefulWidget {
  UserProfile({Key key, this.auth, this.userId,this.email, this.onSignedOut})
      : super(key: key);
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;
  final String email;
  @override
  State<StatefulWidget> createState() => new  _UserProfileState();
 
}

class _UserProfileState extends State<UserProfile> {
  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }
  
  String _email;
  String _id;
  String _username;
  User user;

  @override
  void initState(){
    _email = widget.email;
    List usernames = _email.split("@");
    _username = usernames[0].toString().toUpperCase(); 

    user.email = _email;
    user.username = _username;
    super.initState();  
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold( 
      appBar: new AppBar(
        title: new Text('$_email', style: GoogleFonts.pacifico(),),
        actions: <Widget>[
          new FlatButton(
              child: new Text('Logout',
                  style: new TextStyle(fontSize: 17.0, color: Colors.white)),
              onPressed: _signOut)
        ],
      ),
      drawer: CommonDrawer(),
      body: Center(
            child: new Column(
              children: <Widget>[
                new SizedBox(height: 12,),
                new SizedBox(height: 25.0,),
                new Text('Welcome $_username ', style: new TextStyle(fontWeight: FontWeight.bold, fontSize:20, color: Colors.black,),),
                new Divider(height: 30,color: Colors.white,),
                new Divider(height: 30,color: Colors.white),
                new Padding(padding: new EdgeInsets.only(left: 8, right: 8),
                 child: new FlatButton(onPressed: (){
                      MyNavigator.goToPlayList(context);
                 },
                  child: new Container(
                    child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                      new Icon(Icons.person_add,color: Colors.white, ),
                      new SizedBox(width: 30,),
                      new Text('My Preferences List', style: new TextStyle(color: Colors.white,))
                    ],)),color: Colors.red,),),
              ],
            ),
      ),
    );
  }
}

