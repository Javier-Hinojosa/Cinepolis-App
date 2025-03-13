import 'package:Cinepolis/app/widgets/custom_button/custom_button_large.widget.dart';
import 'package:Cinepolis/app/widgets/progress/progress.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'recovery.controller.dart';

class RecoveryPasswordPage extends GetView<RecoveryPasswordController> {
  const RecoveryPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40.0),
          topLeft: Radius.circular(40.0),
        ),
        border: Border.all(
          color: Colors.transparent,
          width: 2,
        ),
      ),
      child: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'assets/images/restore-pass.jpeg',
              height: 230,
            ),
            Text("Ingresa tu correo electrónico",
                    style: Theme.of(context).textTheme.bodyMedium)
                .paddingOnly(top: 20, bottom: 20),
            TextField(
              obscureText: false,
              controller: controller.email,
              cursorColor: Theme.of(context).hoverColor,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "Correo Electrónico",
                labelStyle: TextStyle(color: Theme.of(context).hoverColor),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).hoverColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).hoverColor),
                ),
              ),
            ),
            Container(
                    margin: const EdgeInsets.only(left: 40, right: 40),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    child: controller.loadingButton.value
                        ? ProgressPrimary().paddingOnly(top: 10, bottom: 10)
                        : CustomButtonLarge(
                            text: 'Recuperar',
                            onPressed: () => controller.send(),
                            color: Theme.of(context).primaryColor,
                          ))
                .paddingOnly(top: 25, bottom: 20),
            Center(
              child: TextButton(
                  child: Text('Cancelar',
                      style: Theme.of(context).textTheme.bodyMedium),
                  onPressed: () => Get.back()),
            ).paddingOnly(bottom: 15)
          ],
        );
      }).paddingAll(10),
    );
  }
}
