import 'dart:math';

import 'package:flutter/material.dart';
import 'package:insta/model/feed_model.dart';
import 'package:insta/search/model/random_post_model.dart';
import 'package:insta/widgets/feed_card_widget.dart';
import 'package:insta/widgets/insta_app_bar.dart';
import 'package:insta/widgets/stateful_scroll_view.dart';

final DoubleHolder offsetExplore = new DoubleHolder();

class ExploreScreen extends StatelessWidget {
  final List<RandomPostModel> randomPosts;
  ExploreScreen({this.randomPosts});
  
  final _random = new Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InstaAppBar(
        title: Text('Explore',textScaleFactor: 1.1,),
      ),
      body: Container(
        child: StatefulScrollView(
          offsetExplore,
          randomPosts.length,
          (context,i)=>FeedCard(
            feedModel: new FeedModel(
              thumNailUrl: randomPosts[i].imageUrl,
              photoUrl: randomPosts[randomPosts.length-i-1].imageUrl,
              name: String.fromCharCodes(List.generate(5, (index) => _random.nextInt(33) + 89)),
              date: "OCTOBER ${_random.nextInt(30)}"
            ),
          )
        ),
      ),
    );
  }
}