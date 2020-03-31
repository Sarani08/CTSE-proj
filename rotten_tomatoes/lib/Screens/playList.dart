import 'package:cloud_firestore/cloud_firestore.dart';

class PlayList {
  String url;
  String avatar;
  DocumentReference reference;

  PlayList(String url, String avatar) {
    this.url = url;
    this.avatar = avatar;
  }

  PlayList.fromMap(Map<String, dynamic> map, {this.reference}) {
    url = map["url"];
    avatar = map["avatar"];
  }

  PlayList.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  toJson() {
    return {'url': url, 'avatar': avatar};
  }
}
