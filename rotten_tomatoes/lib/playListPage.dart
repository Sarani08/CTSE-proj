import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'playList.dart';
import 'playListApi.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlayList',
      home: PlayListHomePage(),
    );
  }
}

class PlayListHomePage extends StatefulWidget {
  PlayListHomePage() : super();

  final String title = 'PlayList';

  @override
  PlayListSState createState() => PlayListSState();
}

class PlayListSState extends State<PlayListHomePage> {
  bool showTextField = false;
  TextEditingController controller = TextEditingController();
  TextEditingController urlcontroller = TextEditingController();
  String collectionName = "Users";
  bool isEditing = false;
  PlayList curPlayList;
  PlayListApi playListApi = new PlayListApi();



  Widget buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: playListApi.getList(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('ERROR ${snapshot.error}');
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
    final playList = PlayList.fromSnapshot(data);
    return Padding(
      key: ValueKey(playList.name),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(playList.name),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              //delete playlist
              playListApi.deleteList(playList);
            },
          ),
          onTap: () {
            // update playlist
            setUpdateUI(playList);
          },
        ),
      ),
    );
  }

  add() {
    if (isEditing) {
      playListApi.updateList(curPlayList, controller.text,urlcontroller.text);
      setState(() {
        isEditing = false;
      });
    } else {
      playListApi.addList(controller.text,urlcontroller.text);
    }
    controller.text = 'abc';
    urlcontroller.text = 'abc';
  }

  setUpdateUI(PlayList playList) {
    controller.text = playList.name;
    urlcontroller.text = playList.url;
    setState(() {
      showTextField = true;
      isEditing = true;
      curPlayList = playList;
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
            showTextField = false;
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
                showTextField = !showTextField;
              });
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              showTextField
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                        labelText: "Name", hintText: "Enter name"),
                  ),
                  SizedBox(height: 10),
                  button(),
                ],
              )
                  : Container(),
              SizedBox(height: 20),
              Text(
                "PlayList",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 20),
              Flexible(
                child: buildBody(context),
              ),
            ]),
      ),
    );
  }
}
