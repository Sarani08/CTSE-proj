import 'package:cloud_firestore/cloud_firestore.dart';
import 'PlayList.dart';

class PlayListApi {
  String collectionName = "Preference";
  PlayList curPlayList;
  bool isEditing = false;

  getList() {
    return Firestore.instance.collection(collectionName).snapshots();
  }

  addToList(String title, int critics, int url, String avatar) {
    PlayList playlist = new PlayList(title, critics, url,avatar);
    try {
      Firestore.instance.runTransaction(
            (Transaction transaction) async {
          await Firestore.instance
              .collection(collectionName)
              .document()
              .setData(playlist.toJson());
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }

  updateList(PlayList playList, String newUrl) {
    try {
      Firestore.instance.runTransaction((transaction) async {
        await transaction
            .update(playList.reference, {'url': newUrl});
      });
    } catch (e) {
      print(e.toString());
    }
  }

  deleteList(PlayList playList) {
    Firestore.instance.runTransaction(
          (Transaction transaction) async {
        await transaction.delete(playList.reference);
      },
    );
  }
}
