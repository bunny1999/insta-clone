import 'package:flutter/material.dart';
import 'package:insta/constant/color.dart';
import 'package:insta/fake_data.dart';
import 'package:insta/search/helper/random_post_model_helper.dart';
import 'package:insta/search/model/random_post_model.dart';
import 'package:insta/search/screen/explore_screen.dart';
import 'package:insta/widgets/insta_app_bar.dart';
import 'package:insta/widgets/stateful_scroll_view.dart';
final DoubleHolder offsetSearch = new DoubleHolder();

final List<RandomPostModel> randomPosts=[];
final List<DoubleHolder> offsetExplores=[];

class GridScreen extends StatefulWidget {
  @override
  _GridScreenState createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  
  @override
  void initState(){
    super.initState();
    if(randomPosts.length<1)
      for(var url in randomPhotos){
        randomPosts.add(randomPostModelHelper(url));
        offsetExplores.add(DoubleHolder());
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InstaAppBar(
        centerTitle: true,
        title: Container(
          height: 30.0,
          child: TextFormField(
            autofocus: false,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search',
              isDense: true,
              focusedBorder: new OutlineInputBorder(
                borderSide: BorderSide(width: 0.1),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(5.0),
                ),
              ),
              border: new OutlineInputBorder(
                borderSide: BorderSide(width: 0.1),
                borderRadius: const BorderRadius.all(
                  const Radius.circular(5.0),
                ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0.0)
            )
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.qr_code_outlined), 
            onPressed: null
          )
        ],
      ),
      body: Container(
        child: StatefulScrollView(
          offsetSearch,
          randomPosts.length,
          (context,index){
            return InkWell(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: 
                    (context)=>ExploreScreen(
                      randomPosts: randomPosts,
                      offsetExplore: offsetExplores[index],
                    )
                  )
                );
              },
              child: Image(
                loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress){
                  if(loadingProgress==null) return child;
                  return Container(
                    height: 200.0,
                    width: 150.0,
                    color: placeholderColor,
                  );
                },
                image: NetworkImage(randomPosts[index].imageUrl),
              ),
            );
          },
          isGrid: true,
        ),
      ),
    );
  }
}