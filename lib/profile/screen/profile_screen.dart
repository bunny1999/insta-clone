import 'package:flutter/material.dart';
import 'package:insta/constant/color.dart';
import 'package:insta/model/user_model.dart';
import 'package:insta/profile/widgets/number_column.dart';
import 'package:insta/widgets/insta_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel userModel;
  ProfileScreen({this.userModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InstaAppBar(
        title: Text(
          userModel.username,
          textScaleFactor: 1.2,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu), 
            onPressed: (){}
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            ProfileInfo(userModel: userModel,),
            PostsGridView(posts: userModel.posts,)
          ],
        ),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final UserModel userModel;
  ProfileInfo({this.userModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Expanded(
            flex:2,
            child:Container(
              margin: EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image:NetworkImage(userModel.photoUrl)
                        )
                      ),
                    ) 
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        Expanded(
                          child: NumberColumn(
                            number: userModel.posts.length.toString(),
                            title: 'Posts',
                          )
                        ),
                        Expanded(
                          child: NumberColumn(
                            number: userModel.followers,
                            title: 'Followers',
                          )
                        ),
                        Expanded(
                          child: NumberColumn(
                            number: userModel.following,
                            title: 'Following',
                          )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userModel.name,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(userModel.description)
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: RaisedButton(
                          elevation: 0.6,
                          color: placeholderColor,
                          onPressed: (){}, 
                          child: Text('Edit Profile'),
                        ),
                      ),
                      SizedBox(width: 8.0,),
                      Expanded(
                        child: RaisedButton(
                          elevation: 0.6,
                          color: placeholderColor,
                          onPressed: (){}, 
                          child: Text('Saved'),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          )
        ]
      ),
    );
  }
}

class PostsGridView extends StatelessWidget {
  final List<Post> posts;
  PostsGridView({this.posts});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: posts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
        ), 
        itemBuilder: (context,i){
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(posts[i].imageUrl)
              )
            ),
          );
        }
      ),
    );
  }
}