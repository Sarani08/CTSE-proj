import 'package:cloud_firestore/cloud_firestore.dart';

class PlayList {
  String title;
  int critics; // critics pick
  int url;
  String avatar;
  DocumentReference reference;

  PlayList(String title, int critics, int url, String avatar) {
    this.title = title;
    this.critics = critics;
    this.url = url;
    this.avatar = avatar;
  }

  PlayList.fromMap(Map<String, dynamic> map, {this.reference}) {
    title = map["title"];
    critics = map["critics"];
    url = map["url"];
    avatar = map["avatar"];
  }

  PlayList.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  toJson() {
    return {'title': title, 'critics': critics,'url': url, 'avatar': avatar};
  }
}
