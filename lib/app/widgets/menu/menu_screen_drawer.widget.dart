import 'package:Cinepolis/app/pages/main/main.controller.dart';
import 'package:Cinepolis/app/widgets/progress/progress_liner.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuScreenDrawer extends GetView<MainController> {
  const MenuScreenDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).inputDecorationTheme.fillColor,
      body: SafeArea(
        child: Obx(() {
          return controller.loading.value
              ? ProgressLinerPrymary()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _picture().paddingOnly(top: 5, left: 13),
                    _header(context).paddingOnly(top: 10, left: 5, bottom: 10),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.menuItems.length + 1,
                        itemBuilder: (_, index) {
                          if (index == 0) {
                            return const Divider(
                              height: 0,
                            );
                          }
                          final e = controller.menuItems[index - 1];
                          return ListTile(
                            leading: e.icon,
                            title: Text(e.label,
                                style: Theme.of(context).textTheme.bodyMedium),
                            onTap: () {
                              e.action();
                              controller.actionDrawer();
                            },
                          );
                        },
                      ),
                    )
                  ],
                ).paddingOnly(left: 5);
        }),
      ),
    );
  }

  Widget _picture() {
    return GestureDetector(
      onTap: () => controller.goToProfile(),
      child: Container(
          width: 95,
          height: 95,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  '${MainController.imagesUrl}${controller.userV.value.id != 0 ? controller.userV.value.picture : 'profile.jpg'}'),
            ),
          )).paddingOnly(top: 25, left: 10),
    );
  }

  Widget _header(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          controller.profile.first.nombreCompleto,
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(fontWeightDelta: FontWeight.bold.index),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          controller.userV.value.code,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyLarge,
          overflow: TextOverflow.ellipsis,
        ).paddingOnly(top: 3),
        Text(controller.profile.first.correoE,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyLarge,
                overflow: TextOverflow.ellipsis)
            .paddingOnly(top: 3),
      ],
    ).paddingOnly(top: 12, left: 5);
  }
}
