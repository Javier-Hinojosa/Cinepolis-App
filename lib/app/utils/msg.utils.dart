import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MsgUtils {
  static success(String message, {title = 'Operacion correcta'}) {
    _showMessage(message, title: title);
  }

  static error(String message, {String title = 'Error'}) {
    _showMessage(message, title: title);
  }

  static _showMessage(String message, {String title = 'Mensaje'}) {
    Get.defaultDialog(title: title, middleText: message, actions: [
      ElevatedButton(
          onPressed: () => Get.back(),
          child: Text(
            "Aceptar",
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black)))
    ]);
  }

  static confirm(BuildContext context, String message, Function onConfirm,
      Function onCancel,
      {String title = 'Confirmación',
        String acceptText = 'Aceptar',
        String cancelText = 'Cancelar'}) async {
    final result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (builder) {
          return AlertDialog(
            title: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            content: Text(message),
            actions: <Widget>[
              _options(context, cancelText, isCancel: false),
              _options(context, acceptText, isCancel: true),
            ],
          );
        });

    if (result)
      onConfirm();
    else
      onCancel();
  }

  static Future<bool> exit(BuildContext context, String message,
      GestureTapCallback onConfirm) async {
    final result = await Get.dialog(AlertDialog(
      title: Text(
        "Advertencia",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
      content: Text(
        message,
        textAlign: TextAlign.start,
      ),
      actions: <Widget>[
        _options(context, 'Cancelar', isCancel: false),
        _options(context, 'Aceptar', isCancel: true),
      ],
    ));
    if (result) onConfirm();
    return result;
  }

  static TextButton _options(BuildContext context, String text,
      {bool isCancel = false}) {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          textStyle: const TextStyle(fontSize: 16),
        ),
        child: Text(text),
        onPressed: () {
          Navigator.of(context).pop(isCancel);
        });
  }
}

class SnackUtils {
  static success(String? message, {title = 'Operacion correcta'}) {
    _showSnack(message!, title: title);
  }

  static error(String message, String title) {
    _showSnack(message, title: title);
  }

  static _showSnack(String message, {String title = 'Mensaje'}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.white12,
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 20),
    );
  }
}

