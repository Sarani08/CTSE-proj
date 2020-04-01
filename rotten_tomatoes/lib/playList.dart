import 'package:cloud_firestore/cloud_firestore.dart';

class PlayList{
  String url;
  var avatar;
  DocumentReference reference;

  PlayList({this.url});

  PlayList.fromMap(Map<String,dynamic> map,{this.reference}){
    url=map["url"];
    avatar=map["avatar"];
  }
  PlayList.fromSnapshot(DocumentSnapshot snapshot)
      :this.fromMap(snapshot.data,reference:snapshot.reference);

  toJson(){
    return {'url':url};
  }
}