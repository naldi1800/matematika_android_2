// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:matematika/app/util/menu.dart';
import 'package:matematika/app/util/ui.dart';

import '../controllers/edit_soal_controller.dart';

class EditSoalView extends GetView<EditSoalController> {
  const EditSoalView({super.key});
  @override
  Widget build(BuildContext context) {
    var layar = MediaQuery.of(context).size;
    var cardWitdh = (layar.width / 4) + (layar.width / 2) + (layar.width / 10);
    var id = Get.arguments;
    controller.setData();
    // print("ID Soal : $id");
    // var optHeight = 50.0;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: UI.backgroud,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                width: cardWitdh,
                height: layar.height,
                child: SingleChildScrollView(
                  child: Obx(() {
                    if (controller.load.value) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Persamaan 1",
                            style: TextStyle(
                              color: UI.action,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 5),
                          UI.perInput(controller.cQ1),
                          const SizedBox(height: 10),
                          const Text(
                            "Persamaan 2",
                            style: TextStyle(
                              color: UI.action,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 5),
                          UI.perInput(controller.cQ2),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  controller.clear();
                                },
                                style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(UI.action),
                                ),
                                child: const Text(
                                  "Clear",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: UI.object),
                                ),
                              ),
                              const SizedBox(width: 5),
                              ElevatedButton(
                                onPressed: () async {
                                  controller.saved(id);
                                },
                                style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(UI.action),
                                ),
                                child: const Text(
                                  "Save",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: UI.object),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 105),
                        ],
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
                ),
              ),
            ),
            Menu.admin,
          ],
        ),
      ),
    );
  }
}
