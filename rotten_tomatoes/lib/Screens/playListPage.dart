import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'PlayList.dart';
import 'PlayListApi.dart';
import 'package:google_fonts/google_fonts.dart';
import '../navigation.dart';

class PlayListView extends StatefulWidget {
  PlayListView() : super();

  final String title = "Play List";

  @override
  PlayListState createState() => PlayListState();
}

class PlayListState extends State<PlayListView> {
  bool titleField = false;
  TextEditingController titleController = TextEditingController();
  String collectionName = "Preference";
  bool isEditing = false;
  PlayList curPlay;
  PlayListApi api = new PlayListApi();

  Widget buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: api.getList(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error ${snapshot.error}');
        }
        if (snapshot.hasData) {
          print("Documents ${snapshot.data.documents.length}");
          return buildList(context, snapshot.data.documents);
        }
        return CircularProgressIndicator();
      },
    );
  }

  Widget buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot.map((data) => buildListItem(context, data)).toList(),
    );
  }

  Widget buildListItem(BuildContext context, DocumentSnapshot data) {
    final playlist = PlayList.fromSnapshot(data);
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 55.0,
                  width: 55.0,
                  child: CircleAvatar(
                          backgroundImage: NetworkImage(playlist.avatar),
                      ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(playlist.title,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0)),
                    Text('Critics Pick : ${playlist.critics}', style: TextStyle(color: Colors.grey))
                  ],
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(children: <Widget>[
                IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // delete from preference list
                      api.deleteList(playlist);
                    }),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  add() {
    if (isEditing) {
      // Update
      api.updateList(curPlay, titleController.text);
      setState(() {
        isEditing = false;
      });
    }
    titleController.text = '';
  }

  setUpdateUI(PlayList playList) {
    titleController.text = playList.title;
    setState(() {
      titleField = true;
      isEditing = true;
      curPlay = playList;
    });
  }

  button() {
    return SizedBox(
      width: double.infinity,
      child: OutlineButton(
        child: Text(isEditing ? "UPDATE" : "ADD"),
        onPressed: () {
          add();
          setState(() {
            titleField = false;
          });
        },
      ),
    );
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
          "Preferences",
          style: GoogleFonts.pacifico(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            titleField
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: titleController,
                        decoration: InputDecoration(
                            labelText: "Name", hintText: "Change Name"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      button(),
                    ],
                  )
                : Container(),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: buildBody(context),
            ),
            new Container (
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.playlist_add,
                ),
                onPressed: (){
                  MyNavigator.goToHome(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
