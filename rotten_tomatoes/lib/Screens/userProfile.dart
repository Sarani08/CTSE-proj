/*
This page is the user profile page which comes when a person logins in /registers with his/her basic information icluding name and email.
Also in here the user has the ability of setting up his/her profile picture and also once done he can logout through this.
Alerrt dialogs are used here
*/

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:rotten_tomatoes/Services/auth.dart';
import '../navigation.dart';
import 'package:google_fonts/google_fonts.dart';


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
  
  // signout the user once the user is logged in
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
  File _image;
  String _uploadedFileURL;

  @override
  void initState(){
  // binding the passed variables from previous page to UI
    _email = widget.email;
    List usernames = _email.split("@");
    _username = usernames[0].toString().toUpperCase(); 

    super.initState();  
  }

  @override
  Widget build(BuildContext context) {

    /* the below methods are used to upload profile picture by the user and upload the picture to the firebase storage.
       the codes that were referred to are : 
       1. https://www.c-sharpcorner.com/article/upload-image-file-to-firebase-storage-using-flutter/
    */
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
 
      setState(() {
        _image = image;
          print('Image Path $_image');
      });
    }

    Future uploadPic(BuildContext context) async{
      //the subfolder name in firebase storage is profiles
       StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child('profiles/${Path.basename(_image.path)}');
       StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
       await uploadTask.onComplete;
       firebaseStorageRef.getDownloadURL().then((fileURL) {
          setState(() {
              _uploadedFileURL = fileURL;
              print("Profile Picture uploaded");
              Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
          });
       });
    }

    return new Scaffold( 
      appBar: new AppBar(
        title: new Text('$_email', style: GoogleFonts.pacifico(),),
        actions: <Widget>[
          new FlatButton(
              child: new Text('Logout',
                  style: new TextStyle(fontSize: 15.0, color: Colors.white)),
              onPressed: () {
                //Alert to confirm Logout
                  Alert(
                        context: context,
                        type: AlertType.error,
                        title: "Logout",
                        desc: "Are you sure you want to Logout from $_email?",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Logout",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              //Logout
                              _signOut();
                              //navigate to home page onced log out
                              MyNavigator.goToHome(context);
                            },
                            color: Colors.red,
                          ),
                          DialogButton(
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            //navigate back to the current page when cancelled
                            onPressed: () => Navigator.pop(context),
                            color: Colors.black26,
                          )
                        ],
                      ).show();}),
        ],
      ),
      body: Center(
            child: new Column(
              children: <Widget>[
                new SizedBox(height: 25.0,),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: new SizedBox(
                          width: 180.0,
                          height: 180.0,
                          //setting up profilee picture based on availability
                          child: (_image!=null)?Image.file(
                            _image,
                            fit: BoxFit.fill,
                          ):(_uploadedFileURL!=null)?Image.network(
                              _uploadedFileURL,
                            fit: BoxFit.fill,
                          ):Image.network(
                            "https://media.istockphoto.com/vectors/user-profile-icon-flat-red-round-button-vector-illustration-vector-id1162440985?k=6&m=1162440985&s=170667a&w=0&h=-Dp28TcalF7T4ejiF_b51RgKcGFWi2VqSHgWHLpkCHY=",
                            fit: BoxFit.fill,),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 150.0),
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.camera,
                        size: 20.0,
                      ),
                      onPressed: () {
                        getImage();
                        uploadPic(context);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
                new Divider(height: 30,color: Colors.white,),
              // shows the user his username and email
                Container(
                margin: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('Username',
                        style:
                            TextStyle(color: Colors.blueGrey, fontSize: 18.0)),
                    SizedBox(width: 20.0),
                    Text('$_username',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),  
               Container(
                margin: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('Email',
                        style:
                            TextStyle(color: Colors.blueGrey, fontSize: 18.0)),
                    SizedBox(width: 20.0),
                    Text('        $_email',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),              
               SizedBox(
                height: 30.0,
              ),

                new Padding(padding: new EdgeInsets.only(left: 8, right: 8),
                
                 child: new FlatButton(onPressed: (){
                   //navigate to user based watch list
                      MyNavigator.goToWatchList(context);
                 },
                  child: new Container(
                    child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                      new Icon(Icons.person_add,color: Colors.white, ),
                      new SizedBox(width: 30,),
                      new Text('My Watch List', style: new TextStyle(color: Colors.white,))
                    ],)),color: Colors.red,),),
              ],
            ),
      ),
    );
  }
}

