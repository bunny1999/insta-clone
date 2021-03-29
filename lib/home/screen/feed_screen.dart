import 'package:flutter/material.dart';
import 'package:insta/fake_data.dart';
import 'package:insta/helper/feed_model_helper.dart';
import 'package:insta/model/feed_model.dart';
import 'package:insta/widgets/feed_card_widget.dart';
import 'package:insta/widgets/insta_app_bar.dart';
import 'package:insta/widgets/stateful_scroll_view.dart';

final DoubleHolder offsetHome = new DoubleHolder();

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InstaAppBar(
        centerTitle: true,
        title: Text(
          'Instagram',
          textScaleFactor: 1.3,
        ),
        leading: IconButton(
          icon: Icon(Icons.camera_alt_outlined), 
          onPressed: (){}
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.send_outlined),
                onPressed: (){}
              ),
              Positioned(
                right: 15.0,
                top: 12.0,
                child: Icon(Icons.stop_circle,color: Colors.red,size: 12.0,)
              )
            ],
          )
        ],
      ),
      body: Container(
        child: StatefulScrollView(
          offsetHome,
          feedsData.length,  
          (context,i){
            FeedModel _feedModel = feedModelHelper(feedsData[i]);
            return FeedCard(
              feedModel: _feedModel,
            ); 
          }
        ),
      ),
    );
  }
}