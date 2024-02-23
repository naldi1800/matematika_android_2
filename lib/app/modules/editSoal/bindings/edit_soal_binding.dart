import 'package:get/get.dart';

import '../controllers/edit_soal_controller.dart';

class EditSoalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditSoalController>(
      () => EditSoalController(),
    );
  }
}
