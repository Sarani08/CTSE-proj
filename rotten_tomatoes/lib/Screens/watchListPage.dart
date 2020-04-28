import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'watchList.dart';
import 'watchListApi.dart';
import 'package:google_fonts/google_fonts.dart';
import '../navigation.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WatchListView extends StatefulWidget {
  WatchListView() : super();

  final String title = "Play List";

  @override
  WatchListState createState() => WatchListState();
}

class WatchListState extends State<WatchListView> {
  TextEditingController titleController = TextEditingController();
  String collectionName = "WatchList";
  WatchList curItem;
  WatchListApi api = new WatchListApi();
  double _rating;

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
    final watchlist = WatchList.fromSnapshot(data);
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
                          backgroundImage: NetworkImage(watchlist.avatar),
                      ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(watchlist.title,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0)),
                    Text('Critics Pick : ${watchlist.critics}',
                        style: TextStyle(color: Colors.grey)),
                    RatingBar(
                      initialRating: watchlist.userRating,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemSize: 40.0,
                      itemCount: 5,
                      glowColor: Colors.pinkAccent,
                      tapOnlyMode: true,
                      itemPadding: EdgeInsets.symmetric(horizontal: 0.5),
                        itemBuilder: (context, _) => Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                        ),
                      //rating update when changed
                      onRatingUpdate: (value){
                        setState(() {
                          _rating = value;
                          //display Toast message
                          showToast(watchlist,_rating);
                        });
                      },
                    ),
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
                       //Alert box when deleting from items from watchList
                      Alert(
                        context: context,
                        type: AlertType.error,
                        title: "Remove",
                        desc: "Are you sure you want to Remove item from WatchList?",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Remove",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              //delete item
                              api.deleteList(watchlist);
                              //navigate back to the current page
                              Navigator.pop(context);
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
                      ).show();
                    }),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  // display Toast when updated the rating
  void showToast(WatchList item, double value) {
      api.updateList(item, value);
    Fluttertoast.showToast(
        msg: "rating $value updated!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
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
          "Watch List",
          style: GoogleFonts.pacifico(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
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
