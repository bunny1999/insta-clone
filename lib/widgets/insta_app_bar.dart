import 'package:flutter/material.dart';
import 'package:insta/constant/color.dart';

class InstaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool centerTitle;
  final Widget title,leading;
  final List<Widget> actions;
  InstaAppBar({
    this.actions,this.centerTitle,this.leading,this.title});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      centerTitle: centerTitle,
      elevation: 0.0,
      title: title,
      leading: leading,
      actions: actions
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}