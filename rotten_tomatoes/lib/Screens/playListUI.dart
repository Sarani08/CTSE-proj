import 'package:cloud_firestore/cloud_firestore.dart';
import 'playList.dart';
import 'package:flutter/material.dart';
import 'playListApi.dart';

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
    return Card(
      key: ValueKey(playlist.url),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(playlist.avatar),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                playlist.url,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(children: <Widget>[
                SizedBox(width: 70),
                new IconButton(
                    icon: new Icon(Icons.edit),
                    onPressed: () {
                      // edit
                      setUpdateUI(playlist);
                    }),
                new IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // delete
                    api.deleteList(playlist);
                  },
                ),
              ]),
            )
          ],
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
                        decoration: InputDecoration(labelText: "Change name"),
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
