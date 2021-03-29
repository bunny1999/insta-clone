class UserModel{
  final String 
    username,
    name,
    followers,
    following,
    description,
    photoUrl;
  
  final List<Post> posts;
  
  UserModel({
    this.followers,
    this.following,
    this.posts,
    this.username,
    this.description,
    this.name,
    this.photoUrl
  });
}

class Post{
  String imageUrl;
  Post({this.imageUrl});
}