import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  late TextEditingController cName;
  late TextEditingController cEmail;
  late TextEditingController cPassword;
  late TextEditingController cRePassword;
  var showPass = false.obs;

  @override
  void onInit() {
    super.onInit();
    cName = TextEditingController(text: "User baru");
    cEmail = TextEditingController(text: "user3@mtk.com");
    cPassword = TextEditingController(text: "123456");
    cRePassword = TextEditingController(text: "123456");
  }

  @override
  void onClose() {
    super.onClose();
    cName.dispose();
    cEmail.dispose();
    cPassword.dispose();
    cRePassword.dispose();
  }
}
