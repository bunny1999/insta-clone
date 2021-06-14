import 'package:flutter/material.dart';
import 'package:insta/constant/color.dart';
import 'package:insta/model/feed_model.dart';
import 'package:popover/popover.dart';

class FeedCard extends StatelessWidget {
  final FeedModel feedModel; 
  FeedCard({this.feedModel});

  @override
  Widget build(BuildContext context) {
    void _showPopover(){
      showPopover(
        context: context,
        transitionDuration: const Duration(milliseconds: 150),
        bodyBuilder: (context) => Container(),
        onPop: () => print('Popover was popped!'),
        direction: PopoverDirection.bottom,
        width: 200,
        height: 400,
        arrowHeight: 15,
        arrowWidth: 30,
      );
    }

    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FeedCardTop(
            thumbnailUrl: feedModel.thumNailUrl,
            username: feedModel.name,
          ),
          Container(
            color: placeholderColor,
            height: 300.0,
            width: MediaQuery.of(context).size.width,
            child: GestureDetector(
              onLongPress: _showPopover ,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(feedModel.photoUrl)
              ),
            ),
          ),
          FeedCardBottom(
            postDate:feedModel.date
          )
        ],
      ),
    );
  }
}

class FeedCardTop extends StatelessWidget {
  final String thumbnailUrl,username;
  FeedCardTop({this.thumbnailUrl,this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  backgroundImage: NetworkImage(thumbnailUrl),
                ),
                SizedBox(width: 8.0),
                Text(username,
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
    );
  }
}

class FeedCardBottom extends StatelessWidget {
  final String postDate;
  FeedCardBottom({this.postDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          child: Text(postDate,
            textScaleFactor: 0.6,
            style: TextStyle(color: Colors.grey),
          )
        )
      ]
    );
  }
}