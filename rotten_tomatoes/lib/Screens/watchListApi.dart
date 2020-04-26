import 'package:cloud_firestore/cloud_firestore.dart';
import 'watchList.dart';

class WatchListApi {
  String collectionName = "watchList";
  WatchList curWatchList;
  bool isEditing = false;

  getList() {
    return Firestore.instance.collection(collectionName).snapshots();
  }

  addToList(String title, int critics, int url, String avatar,userRating) {
    WatchList watchList = new WatchList(title, critics, url,avatar,userRating);
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

  deleteList(WatchList watchList) {
    Firestore.instance.runTransaction(
          (Transaction transaction) async {
        await transaction.delete(watchList.reference);
      },
    );
  }
}
