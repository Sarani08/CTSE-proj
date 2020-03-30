import 'package:cloud_firestore/cloud_firestore.dart';

class PlayList {
  String name;
  String url;
  DocumentReference reference;

  PlayList({this.name,this.url});

  PlayList.fromMap(Map<String, dynamic> map, {this.reference}) {
    name = map["name"];
    url = map["url"];
  }

  PlayList.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  toJson() {
    return {'name: ': name};
  }
}