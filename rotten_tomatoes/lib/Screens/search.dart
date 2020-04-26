import 'package:cloud_firestore/cloud_firestore.dart';

class PlayList {
  String query;
  String apiKeySuffix = '&api-key=kq71eQPzi5qiOMAHNNc8aTOiBrYkvYWL';
  String urlPrefix = 'https://api.nytimes.com/svc/movies/v2/reviews/all.json?query=';
  String url = '';

  SearchURL(String query) {
    url = urlPrefix+query+apiKeySuffix;
  }


}
