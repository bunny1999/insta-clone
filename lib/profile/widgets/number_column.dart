import 'package:flutter/material.dart';

class NumberColumn extends StatelessWidget {
  final String number;
  final String title;
  NumberColumn({this.number,this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          number,
          textScaleFactor: 1.3,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        Text(
          title
        )
      ],
    );
  }
}