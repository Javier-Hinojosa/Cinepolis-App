import 'package:Cinepolis/app/pages/main/home/widgets/image.widget.dart';
import 'package:Cinepolis/app/pages/main/home/widgets/text.widget.dart';
import 'package:Cinepolis/data/models/entities/dynamic/dynamic_summary.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCard extends StatelessWidget {
  final DynamicSummary cardItem;

  const HomeCard(this.cardItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListView(physics: const NeverScrollableScrollPhysics(), children: [
        Text(cardItem.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium)
            .paddingAll(15),
        _dynamicContain()
      ]),
    );
  }

  Widget _dynamicContain() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: cardItem.fields.map((item) {
          switch (item.type) {
            case 'text':
              return HomeText(item);
            case 'image':
              return HomeImage(item);
            default:
              return const Text('');
          }
        }).toList());
  }
}
