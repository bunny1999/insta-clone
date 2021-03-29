import 'package:flutter/material.dart';
import 'package:insta/bottom_navigation.dart';
import 'package:insta/constant/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insta Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        accentColor: secoundaryColor,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
      ),
      home: BottomNavigation(),
    );
  }
}
