import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:insta/constant/color.dart';
import 'package:insta/fake_data.dart';
import 'package:insta/helper/user_model_helper.dart';
import 'package:insta/home/screen/feed_screen.dart';
import 'package:insta/model/user_model.dart';
import 'package:insta/notification/screen/notification_screen.dart';
import 'package:insta/profile/screen/profile_screen.dart';
import 'package:insta/search/screen/grid_screen.dart';
import 'package:insta/upload/screen/upload_screen.dart';


class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}


class _BottomNavigationState extends State<BottomNavigation> with SingleTickerProviderStateMixin{
  TabController _tabController;
  Queue<int> _navigationQueue;
  UserModel userModel;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(initialIndex: 0,length: 5,vsync: this);
    _navigationQueue = new Queue();
    _navigationQueue.add(0);
    userModel = userModelHelper(userData);
  }
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        if(_navigationQueue.isEmpty) return true;
        _navigationQueue.removeLast();
        _tabController.animateTo(_navigationQueue.last);
        setState(() {});
        return false;
      },
      child: Scaffold(
        body:TabBarView(
          controller: _tabController,
          children: <Widget>[
            FeedScreen(),
            GridScreen(),
            UploadScreen(),
            NotificationScreen(),
            ProfileScreen(userModel: userModel)
          ],
        ),
        bottomNavigationBar:BottomAppBar(
          child: TabBar(
            indicatorColor: primaryColor,
            indicatorWeight: 0.1,
            controller: _tabController,
            onTap: (index){
              if(!_navigationQueue.contains(index))
                _navigationQueue.addLast(index);
              setState(() {});
            },
            tabs: <Widget>[
              Tab(
                icon: _tabController.index==0
                  ?Icon(Icons.home_filled)
                  :Icon(Icons.home_outlined),
              ),
              Tab(
                icon: _tabController.index==1
                  ?Icon(Icons.search,color: secoundaryColor.withOpacity(1.0))
                  :Icon(Icons.search,color: secoundaryColor.withOpacity(0.7))
              ),
              Tab(
                icon: Icon(Icons.add_box),
              ),
              Tab(
                icon: _tabController.index==3
                  ?Icon(Icons.notifications_active)
                  :Icon(Icons.notifications_active_outlined),
              ),
              Tab(
                icon: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _tabController.index==4
                        ?secoundaryColor
                        :primaryColor
                    )
                  ),
                  padding: EdgeInsets.all(2.0), 
                  child: CircleAvatar(
                    maxRadius: 12,
                    backgroundImage: NetworkImage(userModel.photoUrl),
                  )
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}