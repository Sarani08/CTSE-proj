import 'package:cloud_firestore/cloud_firestore.dart';
import 'PlayList.dart';
import 'package:flutter/material.dart';
import 'PlayListApi.dart';

void main() => runApp(PlayListHomePage());

class PlayListHomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PlayListView(),
    );
  }
}

class PlayListView extends StatefulWidget {
  PlayListView() : super();

  final String title = "Play List";

  @override
  PlayListState createState() => PlayListState();
}

class PlayListState extends State<PlayListView> {
  bool urlField = false;
  TextEditingController urlcontroller = TextEditingController();
  String collectionName = "PlayList";
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
    return Padding(
      key: ValueKey(playlist.url),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(playlist.url),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // delete
              api.deleteList(playlist);
            },
          ),
          onTap: () {
            // update
            setUpdateUI(playlist);
          },
        ),
      ),
    );
  }

  add() {
    if (isEditing) {
      // Update
      api.updateList(curPlay, urlcontroller.text);
      setState(() {
        isEditing = false;
      });
    } else {
      api.addToList(urlcontroller.text);
    }
    urlcontroller.text = '';
  }

  setUpdateUI(PlayList playList) {
    urlcontroller.text = playList.url;
    setState(() {
      urlField = true;
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
            urlField = false;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                urlField = !urlField;
              });
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            urlField
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: urlcontroller,
                  decoration: InputDecoration(
                      labelText: "Url", hintText: "Enter url"),
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
          ],
        ),
      ),
    );
  }
}
