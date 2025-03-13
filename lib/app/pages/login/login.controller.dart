import 'package:Cinepolis/data/services/auth/auth.contract.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late IAuthService _service;

  var loginText = 'Ingresar'.obs;
  var duration = Duration(seconds: 2);


  //var username = TextEditingController(text: 'ediaz@esperanza.mx'); // SUPERVISOR
  // var username = TextEditingController(text: 'jcarballido@sethemba.mx'); // EMPLEADO 201
  //var username = TextEditingController(text: 'orocha@esperanza.mx'); // GERENTE 601
  var username = TextEditingController(text: '').obs;
  var password = TextEditingController(text: '').obs;

  LoginController(this._service);

  startTime() async {

    return singIn();
  }

  singIn() async {
    var user = await _service.singIn(username.value.text, password.value.text);

  }

  @override
  void onClose() {
    super.onClose();
  }
}
