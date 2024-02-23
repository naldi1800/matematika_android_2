import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:matematika/app/util/menu.dart';
import 'package:matematika/app/util/ui.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
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
                    "Welcome User",
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
            Menu.user,
          ],
        ),
      ),
    );
  }
}
