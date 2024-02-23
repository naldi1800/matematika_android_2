import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:matematika/app/util/menu.dart';
import 'package:matematika/app/util/ui.dart';

import '../controllers/admin_home_controller.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  const AdminHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UI.backgroud,
      body: SafeArea(
        child: Stack(
          children: [
            //UTAMA
            Container(
              width: double.infinity,
              height: 300,
              margin: const EdgeInsets.all(20),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome Admin",
                    style: TextStyle(
                      fontSize: 30,
                      color: UI.object,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            // Menu
            Menu.admin,
          ],
        ),
      ),
    );
  }
}
