/* 
      This is the watchListApi page wich contains all the crud implementation used.
      Connection of the db is also established
      References:
      1. https://codelabs.developers.google.com/codelabs/flutter-firebase/#8
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'watchList.dart';

class WatchListApi {
  //collection name wish stores all the movie preferences
  String collectionName = "watchList";

  //current object
  WatchList curWatchList;

  //Read and populate the movie preference items
  getList() {
    return Firestore.instance.collection(collectionName).snapshots();
  }

  //add items to the movie preference list
  addToList(String title, int critics, int url, String avatar, userRating) {
    WatchList watchList =
        new WatchList(title, critics, url, avatar, userRating);
    try {
      Firestore.instance.runTransaction(
        (Transaction transaction) async {
          await Firestore.instance
              .collection(collectionName)
              .document()
              .setData(watchList.toJson());
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }

  //update user review of the movie preference list
  updateList(WatchList watchList, double userRating) {
    try {
      Firestore.instance.runTransaction((transaction) async {
        await transaction
            .update(watchList.reference, {'userRating': userRating});
      });
    } catch (e) {
      print(e.toString());
    }
  }

  //delete items from the movie preference list
  deleteList(WatchList watchList) {
    Firestore.instance.runTransaction(
      (Transaction transaction) async {
        await transaction.delete(watchList.reference);
      },
    );
  }
}
