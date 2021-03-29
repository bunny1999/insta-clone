import 'package:insta/model/user_model.dart';

UserModel userModelHelper(var doc){
  List<Post> _posts=[];
  if(doc['posts']!=null)
    for(var url in doc['posts'])
      _posts.add(
        Post(imageUrl: url)
      );

  return UserModel(
    username: doc['username'],
    name: doc['name'],
    description: doc['description'],
    photoUrl: doc['photoUrl'],
    followers: doc['followers'],
    following:doc['following'],
    posts: _posts
  );
}