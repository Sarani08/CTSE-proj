/*
      watchList is the basic class structure for the movie watch list
      References:
      1. https://codelabs.developers.google.com/codelabs/flutter-firebase/#8
*/

import 'package:cloud_firestore/cloud_firestore.dart';

class WatchList {
  String title; //movie title
  int critics; // critics pick
  int url; // id
  String avatar; //movie picture
  double userRating; //user rating
  DocumentReference reference;

  //constructor of watchList class
  WatchList(
      String title, int critics, int url, String avatar, double userRating) {
    this.title = title;
    this.critics = critics;
    this.url = url;
    this.avatar = avatar;
    this.userRating = userRating;
  }

  //key pair values of collection
  WatchList.fromMap(Map<String, dynamic> map, {this.reference}) {
    title = map["title"];
    critics = map["critics"];
    url = map["url"];
    avatar = map["avatar"];
    userRating = map["userRating"];
  }

  WatchList.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  //convert watchList details to JSON structure
  toJson() {
    return {
      'title': title,
      'critics': critics,
      'url': url,
      'avatar': avatar,
      'userRating': userRating
    };
  }
}
