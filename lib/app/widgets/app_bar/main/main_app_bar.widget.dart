import 'package:Cinepolis/app/utils/shadow.utils.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final Widget widget;
  final GestureTapCallback ontap;

  MainAppBar(
      {Key? key,
      this.height = kToolbarHeight,
      required this.title,
      required this.ontap,
      required this.widget})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).primaryColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Builder(
            builder: (context) => GestureDetector(
              child: Container(
                width: 40,
                height: 40,
                decoration: ShadowUtils.hexImageSmall(),
              ),
              onTap: ontap,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).primaryTextTheme.bodyMedium,
          ),
          widget
        ],
      ),
    );
  }
}
