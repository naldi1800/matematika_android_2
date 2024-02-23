import 'package:get/get.dart';

import '../controllers/admin_materi_controller.dart';

class AdminMateriBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminMateriController>(
      () => AdminMateriController(),
    );
  }
}
