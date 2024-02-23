import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:matematika/app/routes/app_pages.dart';
import 'package:matematika/app/util/menu.dart';
import 'package:matematika/app/util/ui.dart';

import '../controllers/admin_materi_controller.dart';

class AdminMateriView extends GetView<AdminMateriController> {
  const AdminMateriView({super.key});
  @override
  Widget build(BuildContext context) {
    var layar = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: UI.backgroud,
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              width: layar.width,
              height: layar.height,
              margin: const EdgeInsets.all(20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 15),
                  const Text(
                    "Materi Sistem Persamaan Linear Dua Variabel",
                    style: TextStyle(fontSize: 20, color: UI.action),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.VIDEO,
                          arguments: {"idVideo": "1", "user": false});
                    },
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(UI.object)),
                    child: const Text(
                      "Video 1",
                      style: TextStyle(color: UI.action),
                    ),
                  ),
                  const SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.VIDEO,
                          arguments: {"idVideo": "2", "user": false});
                    },
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(UI.object)),
                    child: const Text(
                      "Video 2",
                      style: TextStyle(color: UI.action),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Menu.admin,
        ],
      ),
    );
  }
}
