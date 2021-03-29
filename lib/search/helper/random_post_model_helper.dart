import 'package:insta/search/model/random_post_model.dart';

RandomPostModel randomPostModelHelper(var doc){
  if(doc==null) return null;
  return RandomPostModel(
    imageUrl: doc
  );
}