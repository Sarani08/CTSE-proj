import 'package:cloud_firestore/cloud_firestore.dart';
import 'playList.dart';

class PlayListApi {
  String collectionName = "PlayList";
  PlayList curList;
  bool isEditing = false;

  getList() {
    return Firestore.instance.collection(collectionName).snapshots();
  }

  addList(String newName,String newUrl) {
    PlayList playlist = PlayList(name: newName,url: newUrl);
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

  updateList(PlayList playlist, String newName, String newUrl) {
    try {
      Firestore.instance.runTransaction((transaction) async {
        await transaction.update(playlist.reference, {'name': newName,'url':newUrl});
      });
    } catch (e) {
      print(e.toString());
    }
  }

  deleteList(PlayList playlist) {
    Firestore.instance.runTransaction((Transaction transaction) async {
      await transaction.delete(playlist.reference);
    });
  }
}
