import 'package:Cinepolis/app/widgets/app_bar/simple_app_bar/simple_app_bar.widget.dart';
import 'package:Cinepolis/app/widgets/custom_button/custom_button_large.widget.dart';
import 'package:Cinepolis/app/widgets/progress/progress.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile.controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SimpleAppBar(title: "Mi Perfil"),
        body: Obx(() {
          return controller.loading.value
              ? Center(child: ProgressPrimary())
              : SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        _imageContain()
                            .paddingOnly(bottom: 30)
                            .paddingOnly(top: 20),
                        _textPain(context,
                                controller.profile.first.nombreCompleto)
                            .paddingOnly(bottom: 15),
                        _textPain(context, controller.profile.first.noEmpleado)
                            .paddingOnly(bottom: 15),
                        _textPain(
                                context,
                                controller.profile.first.telefono != 0
                                    ? controller.profile.first.telefono
                                        .toString()
                                    : 'Sin Teléfono')
                            .paddingOnly(bottom: 15),
                        _textPain(context, controller.profile.first.correoE)
                            .paddingOnly(bottom: 15),
                        _buttonExit(context)
                            .paddingOnly(top: 15, left: 10, bottom: 20)
                      ],
                    ),
                  ),
                );
        }));
  }

  Widget _imageContain() {
    return Container(
      width: 170,
      height: 170,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
                '${controller.imagesUrl}${controller.user.value.id != 0 ? controller.user.value.picture : 'profile.jpg'}'),
          )),
    );
  }

  Text _textPain(BuildContext context, String text) {
    return Text(text, style: Theme.of(context).textTheme.bodyMedium);
  }

  Widget _buttonExit(BuildContext context) {
    return CustomButtonLarge(
        text: 'Cerrar Sesión',
        color: Theme.of(context).primaryColor,
        onPressed: () => controller.singOut()).paddingAll(30);
  }
}
