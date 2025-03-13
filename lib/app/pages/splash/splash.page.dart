import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splash.controller.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Theme.of(context).scaffoldBackgroundColor,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/logo_esp_small.jpeg')
                  .paddingOnly(top: 20),
              _animatedText(context).paddingOnly(top: 35)
            ],
          ),
        ),
      ),
    );
  }

  Widget _animatedText(BuildContext context) {
    return Obx(() {
      return AnimatedOpacity(
        // If the widget is visible, animate to 0.0 (invisible).
        // If the widget is hidden, animate to 1.0 (fully visible).
        opacity: controller.fadeText.value ? 1.0 : 0.0,
        duration: Duration(seconds: 2),
        // The green box must be a child of the AnimatedOpacity widget.
        child: Text(
          '${controller.nameCorporation}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    });
  }
}
