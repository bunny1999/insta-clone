import 'package:insta/model/feed_model.dart';

FeedModel feedModelHelper(var doc){
  return FeedModel(
    date: doc['date'],
    name: doc['name'],
    thumNailUrl: doc["thumbNail"],
    photoUrl: doc["photo"],
  );
}