import 'package:flutter/material.dart';
import 'package:insta/constant/color.dart';
import 'package:insta/model/feed_model.dart';

class FeedCard extends StatelessWidget {
  final FeedModel feedModel; 
  FeedCard({this.feedModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 8.0),
                  child: Row(
                    children:[
                      CircleAvatar(
                        maxRadius: 18.0,
                        backgroundColor: placeholderColor,
                        backgroundImage: NetworkImage(feedModel.thumNailUrl),
                      ),
                      SizedBox(width: 8.0),
                      Text(feedModel.name,
                        textScaleFactor: 1.1,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ]
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.more_vert), 
                  onPressed: (){}
                )
              ],
            ),
          ),
          Container(
            color: placeholderColor,
            height: 300.0,
            width: MediaQuery.of(context).size.width,
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(feedModel.photoUrl)
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.thumb_up_off_alt), 
                        onPressed: (){}
                      ),
                      IconButton(
                        icon: Icon(Icons.chat_bubble_outline_outlined), 
                        onPressed: (){}
                      ),
                      IconButton(
                        icon: Icon(Icons.share_outlined), 
                        onPressed: (){}
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.bookmark_border_outlined), 
                  onPressed: (){}
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left:8.0),
            child: Text(feedModel.date,
              textScaleFactor: 0.6,
              style: TextStyle(color: Colors.grey),
            )
          )
        ],
      ),
    );
  }
}