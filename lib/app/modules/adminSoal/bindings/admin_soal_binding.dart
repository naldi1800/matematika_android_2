import 'package:get/get.dart';

import '../controllers/admin_soal_controller.dart';

class AdminSoalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminSoalController>(
      () => AdminSoalController(),
    );
  }
}
