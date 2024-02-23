import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:matematika/app/controllers/auth_controller.dart';
import 'package:matematika/app/util/menu.dart';
import 'package:matematika/app/util/ui.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    AuthController auth = Get.find<AuthController>();
    var layar = MediaQuery.of(context).size;
    // print("arg ${Get.arguments}");
    return Scaffold(
        backgroundColor: UI.backgroud,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                width: layar.width,
                height: layar.height,
                margin: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 5),
                    Container(
                      width: layar.width / 2 + layar.width / 3,
                      height: layar.height / 3,
                      decoration: BoxDecoration(
                        color: UI.foreground,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(23)),
                        border: Border.all(color: UI.action),
                      ),
                      child: StreamBuilder<DocumentSnapshot>(
                          stream: controller.getData(Get.arguments),
                          builder: (context, snapshot) {
                            print(snapshot.connectionState);
                            if (snapshot.connectionState ==
                                ConnectionState.active) {
                              if (snapshot.data != null) {
                                Map<String, dynamic> datas = snapshot.data!
                                    .data() as Map<String, dynamic>;
                                // print(datas);

                                controller.isTest.value =
                                    datas['isTest'] as bool;

                                controller.setData();
                                // return const Center(
                                //     child: CircularProgressIndicator());
                                return Obx(
                                  () => Visibility(
                                    visible: controller.onLoad.value,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 45,
                                          margin: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 2.5,
                                            bottom: 2.5,
                                          ),
                                          child: ListTile(
                                            title:
                                                Text("Name: ${datas['name']}"),
                                            textColor: UI.action,
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 45,
                                          margin: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 2.5,
                                            bottom: 2.5,
                                          ),
                                          child: ListTile(
                                            title: Text(
                                                "Email: ${datas['email']}"),
                                            textColor: UI.action,
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 45,
                                          margin: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 2.5,
                                            bottom: 2.5,
                                          ),
                                          child: ListTile(
                                            title: Text(
                                                "Skor: ${((controller.skor).isNaN) ? "Belum Ujian" : controller.skor}"),
                                            textColor: UI.action,
                                          ),
                                        ),
                                        // Container(
                                        //   width: double.infinity,
                                        //   height: 45,
                                        //   margin: const EdgeInsets.only(
                                        //     left: 20,
                                        //     right: 20,
                                        //     top: 2.5,
                                        //     bottom: 2.5,
                                        //   ),
                                        //   child: ListTile(
                                        //     title: Text(
                                        //         "Ujian: anda ${(datas['isTest']) ? 'sudah ujian' : 'belum ujian'}"),
                                        //     textColor: UI.action,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          }),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        auth.logout();
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(UI.object),
                      ),
                      child: const Text(
                        "LogOut",
                        style: TextStyle(
                          fontSize: 15,
                          color: UI.action,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Menu.user
            ],
          ),
        ));
  }
}
