import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matematika/app/controllers/auth_controller.dart';
import 'package:matematika/app/routes/app_pages.dart';
import 'package:matematika/app/util/ui.dart';

class Menu {
  static Widget user = Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      decoration: const BoxDecoration(
        color: UI.foreground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      width: double.infinity,
      height: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  if (Get.routing.current != Routes.HOME) {
                    Get.offAndToNamed(Routes.HOME, arguments: Get.arguments);
                  }
                },
                child: const Column(
                  children: [
                    Icon(
                      Icons.home,
                      color: UI.action,
                    ),
                    Text("Home", style: TextStyle(color: UI.action)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // print("Root: ${Get.routing.current}");
                  if (Get.routing.current != Routes.MATERI) {
                    Get.offAndToNamed(Routes.MATERI, arguments: Get.arguments);
                  }
                },
                child: const Column(
                  children: [
                    Icon(
                      Icons.subject,
                      color: UI.action,
                    ),
                    Text("Materi", style: TextStyle(color: UI.action)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (Get.routing.current != Routes.PROFILE) {
                    Get.offAndToNamed(Routes.PROFILE, arguments: Get.arguments);
                  }
                },
                child: const Column(
                  children: [
                    Icon(
                      Icons.person,
                      color: UI.action,
                    ),
                    Text("Profil", style: TextStyle(color: UI.action)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );

  static Widget admin = Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      decoration: const BoxDecoration(
        color: UI.foreground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      width: double.infinity,
      height: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  if (Get.routing.current != Routes.ADMIN_HOME) {
                    Get.offAndToNamed(Routes.ADMIN_HOME);
                  }
                },
                child: const Column(
                  children: [
                    Icon(
                      Icons.home,
                      color: UI.action,
                    ),
                    Text("Home", style: TextStyle(color: UI.action)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (Get.routing.current != Routes.ADMIN_SOAL) {
                    Get.offAndToNamed(Routes.ADMIN_SOAL);
                  }
                },
                child: const Column(
                  children: [
                    Icon(
                      Icons.quiz,
                      color: UI.action,
                    ),
                    Text("Soal", style: TextStyle(color: UI.action)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (Get.routing.current != Routes.ADMIN_MATERI) {
                    Get.offAndToNamed(Routes.ADMIN_MATERI);
                  }
                },
                child: const Column(
                  children: [
                    Icon(
                      Icons.subject,
                      color: UI.action,
                    ),
                    Text("Materi", style: TextStyle(color: UI.action)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (Get.routing.current != Routes.USER) {
                    Get.offAndToNamed(Routes.USER);
                  }

                  // AuthController auth = Get.find<AuthController>();
                  // auth.logout();
                },
                child: const Column(
                  children: [
                    Icon(
                      Icons.person_search,
                      color: UI.action,
                    ),
                    Text("User", style: TextStyle(color: UI.action)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Get.offAndToNamed(Routes.USER);

                  AuthController auth = Get.find<AuthController>();
                  auth.logout();
                },
                child: const Column(
                  children: [
                    Icon(
                      Icons.logout,
                      color: UI.action,
                    ),
                    Text("Logout", style: TextStyle(color: UI.action)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
