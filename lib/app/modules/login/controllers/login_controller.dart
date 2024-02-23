import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController cUser = TextEditingController(text: "admin@mtk.com");
  TextEditingController cPass = TextEditingController(text: "123456");
  var showPass = true.obs;

  @override
  void onClose() {
    super.onClose();
    cUser.dispose();
    cPass.dispose();
  }
}
