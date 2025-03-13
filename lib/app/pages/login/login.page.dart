import 'package:Cinepolis/app/pages/login/widgets/recovery.page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login.controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Center(child: Image.asset('assets/images/logo_esp.jpeg'))
                .paddingAll(40),
            _user(controller.username.value, context),
            _password(controller.password.value, context)
                .paddingOnly(top: 16, bottom: 16),
            _containButton(context).paddingOnly(top: 25),
            _forgetPassword(context).paddingOnly(top: 30)
          ]).paddingOnly(top: 10, bottom: 50, left: 16, right: 16),
        ),
      ),
    );
  }

  Widget _forgetPassword(BuildContext context) {
    return Center(
        child: TextButton(
      child: Text(
        "Olvidaste tu contraseña?",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40),
            ),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          builder: (context) => SingleChildScrollView(
            child: Container(
              color: Theme.of(context).indicatorColor,
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: RecoveryPasswordPage(),
            ),
          ),
        );
      },
    ));
  }

  Widget _containButton(BuildContext context) {
    return Obx(() {
      return Container(
        margin: EdgeInsets.only(left: 40, right: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          border: Border.all(
            style: BorderStyle.solid,
            color: Colors.white,
            width: 1.5,
          ),
        ),
        child: ElevatedButton(
          child: Text('${controller.loginText}'),
            onPressed: () => controller.startTime()),
      );
    });
  }

  TextField _user(TextEditingController controller, BuildContext context) {
    return TextField(
      obscureText: false,
      controller: controller,
      cursorColor: Theme.of(context).hoverColor,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Usuario",
        labelStyle: TextStyle(color: Theme.of(context).hoverColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).hoverColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).hoverColor),
        ),
      ),
    );
  }

  TextField _password(TextEditingController controller, BuildContext context) {
    return TextField(
      obscureText: true,
      controller: controller,
      cursorColor: Theme.of(context).hoverColor,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Contraseña",
        labelStyle: TextStyle(color: Theme.of(context).hoverColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).hoverColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).hoverColor),
        ),
      ),
    );
  }
}
