import 'package:flutter/material.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final List<Widget>? actions;

  SimpleAppBar(
      {this.height = kToolbarHeight, required this.title, this.actions});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: true,
      title: Text(title, style: Theme.of(context).primaryTextTheme.bodyMedium),
      actions: actions,
    );
  }
}
