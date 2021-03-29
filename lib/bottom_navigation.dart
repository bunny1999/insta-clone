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
import 'package:insta/widgets/tab_navigation_widget.dart';


class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}


class _BottomNavigationState extends State<BottomNavigation> with SingleTickerProviderStateMixin{
  final _tabNavigator = GlobalKey<TabNavigatorState>();
  final _tab1 = GlobalKey<NavigatorState>();
  final _tab2 = GlobalKey<NavigatorState>();
  final _tab3 = GlobalKey<NavigatorState>();
  final _tab4 = GlobalKey<NavigatorState>();
  final _tab5 = GlobalKey<NavigatorState>();
  
  TabController _tabController;
  Queue<int> _navigationQueue;
  UserModel userModel;

  var _tabSelectedIndex = 0;
  var _tabPopStack = false;


  @override
  void initState(){
    super.initState();
    _tabController = TabController(initialIndex: 0,length: 5,vsync: this);
    _navigationQueue = new Queue();
    _navigationQueue.add(0);
    userModel = userModelHelper(userData);
  }

  _setIndex(int index){
    setState(() {
      _tabPopStack = _tabSelectedIndex == index;
      _tabSelectedIndex = index;
    });
  }

  Future<bool> _onPop() async{
    if(_navigationQueue.isEmpty) return true;

    _navigationQueue.removeLast();
    
    _setIndex(_navigationQueue.last);

    await _tabNavigator.currentState.maybePop();
    return false;
  }

  _onPush(int index){
    if(!_navigationQueue.contains(index))
      _navigationQueue.addLast(index);
    _setIndex(index);
  }
  
  @override
  Widget build(BuildContext context) {
    print(_navigationQueue);
    return WillPopScope(
      onWillPop:()=> _onPop(),
      child: Scaffold(
        body:TabNavigator(
          key: _tabNavigator,
          tabs: <TabItem>[
            TabItem(_tab1,FeedScreen()),
            TabItem(_tab2,GridScreen()),
            TabItem(_tab3,UploadScreen()),
            TabItem(_tab4,NotificationScreen()),
            TabItem(_tab5,ProfileScreen(userModel: userModel))
          ],
          selectedIndex: _tabSelectedIndex,
          popStack: _tabPopStack,
        ),
        bottomNavigationBar:BottomAppBar(
          child: TabBar(
            indicatorColor: primaryColor,
            indicatorWeight: 0.1,
            controller: _tabController,
            onTap: (index)=>_onPush(index),
            tabs: <Widget>[
              Tab(
                icon: _tabSelectedIndex==0
                  ?Icon(Icons.home_filled)
                  :Icon(Icons.home_outlined),
              ),
              Tab(
                icon: _tabSelectedIndex==1
                  ?Icon(Icons.search,color: secoundaryColor.withOpacity(1.0))
                  :Icon(Icons.search,color: secoundaryColor.withOpacity(0.7))
              ),
              Tab(
                icon: Icon(Icons.add_box),
              ),
              Tab(
                icon: _tabSelectedIndex==3
                  ?Icon(Icons.notifications_active)
                  :Icon(Icons.notifications_active_outlined),
              ),
              Tab(
                icon: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _tabSelectedIndex==4
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

