import 'package:Cinepolis/app/pages/main/main.controller.dart';
import 'package:Cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:Cinepolis/data/models/entities/menu/menu.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuAuditPage extends GetView<MainController> {
  final List<MenuItem>? _menuItems;

  const MenuAuditPage(this._menuItems, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SimpleAppBar(title: "Sucursal"),
        body: SafeArea(
            child: GridView.count(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
                crossAxisSpacing: 8,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: _cardCustom(context))));
  }

  List<Widget> _cardCustom(BuildContext context) {
    List<Widget> itemCard = [];
    for (var element in _menuItems!) {
      itemCard.add(InkWell(
        highlightColor: Theme.of(context).splashColor,
        onTap: () => Get.toNamed(element.url),
        child: Card(
          elevation: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                IconData(int.tryParse(element.icon) ?? 59658,
                    fontFamily: 'MaterialIcons'),
                size: context.isTablet ? 75 : 35,
              ),
              Text(
                element.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ).paddingOnly(top: 5)
            ],
          ),
        ),
      ));
    }

    return itemCard;
  }
}
