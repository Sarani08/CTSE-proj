import 'package:file/file.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:rotten_tomatoes/Services/auth.dart';
import 'package:rotten_tomatoes/models/user.dart';
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
  File _image;


  @override
  void initState(){
    _email = widget.email;
    List usernames = _email.split("@");
    _username = usernames[0].toString().toUpperCase(); 

    super.initState();  
  }

  @override
  Widget build(BuildContext context) {

    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
 
      setState(() {
        _image = image;
          print('Image Path $_image');
      });
    }

    Future uploadPic(BuildContext context) async{
      String fileName = basename(_image.path);
       StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
       StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
       StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
       setState(() {
          print("Profile Picture uploaded");
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
       });
    }

    return new Scaffold( 
      appBar: new AppBar(
        title: new Text('$_email', style: GoogleFonts.pacifico(),),
        actions: <Widget>[
          new FlatButton(
              child: new Text('Logout',
                  style: new TextStyle(fontSize: 15.0, color: Colors.white)),
              onPressed: _signOut)
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
                          child: (_image!=null)?Image.file(
                            _image,
                            fit: BoxFit.fill,
                          ):Image.network(
                            "https://www.ecopetit.cat/wpic/mpic/51-515283_girls-for-facebook-profile-wallpaper-photo-on-hd.jpg",
                            fit: BoxFit.fill,
                          ),
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
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
                new Divider(height: 30,color: Colors.white,),

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

