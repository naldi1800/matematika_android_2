import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:matematika/app/routes/app_pages.dart';
import 'package:matematika/app/util/menu.dart';
import 'package:matematika/app/util/ui.dart';

import '../controllers/materi_controller.dart';

class MateriView extends GetView<MateriController> {
  const MateriView({super.key});
  @override
  Widget build(BuildContext context) {
    var layar = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: UI.backgroud,
      body: Stack(
        children: [
          SafeArea(
            child: StreamBuilder(
                stream: controller.getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    var datas = snapshot.data!.docs;
                    controller.userData();
                    return Obx(() {
                      return Container(
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
                                if (controller.user.isNotEmpty) {
                                  if (controller.user['video'] == 0) {
                                    FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(Get.arguments)
                                        .update({"video": 1});
                                  }
                                  Get.offAndToNamed(Routes.VIDEO, arguments: {
                                    "idVideo": "1",
                                    "id": Get.arguments,
                                    "user": true,
                                  });
                                } else {
                                  UI.warning(
                                    msg:
                                        "Tunggu sebentar, masih proses load data",
                                  );
                                }
                              },
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(UI.object)),
                              child: const Text(
                                "Video 1",
                                style: TextStyle(color: UI.action),
                              ),
                            ),
                            const SizedBox(height: 5),
                            ElevatedButton(
                              onPressed: () {
                                if (controller.user.isNotEmpty) {
                                  if (controller.user['video'] > 0) {
                                    if (controller.user['video'] == 1) {
                                      FirebaseFirestore.instance
                                          .collection('users')
                                          .doc(Get.arguments)
                                          .update({"video": 2});
                                    }
                                    Get.offAndToNamed(Routes.VIDEO, arguments: {
                                      "idVideo": "2",
                                      "id": Get.arguments,
                                      "user": true,
                                    });
                                  } else {
                                    UI.warning(
                                      msg:
                                          "Anda harus menonton Video 1 terlebih dahulu",
                                    );
                                  }
                                }
                              },
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(UI.object)),
                              child: const Text(
                                "Video 2",
                                style: TextStyle(color: UI.action),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              alignment: Alignment.centerLeft,
                              width: double.infinity,
                              child: const Text(
                                "Soal :",
                                style:
                                    TextStyle(fontSize: 20, color: UI.action),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Visibility(
                              visible: controller.onLoad.value,
                              child: Expanded(
                                child: SizedBox(
                                  width: double.infinity,
                                  height: layar.height - (layar.height / 3),
                                  child: ListView.builder(
                                    itemCount: datas.length,
                                    itemBuilder: (context, index) {
                                      // if (controller.sisa.isEmpty) {
                                      // controller.sisa.value = List.generate(
                                      //     datas.length,
                                      //     (index) => [-1, false]);
                                      // }
                                      return Container(
                                        padding: const EdgeInsets.all(5),
                                        width: double.infinity,
                                        height: 65,
                                        child: ListTile(
                                          trailing: (controller
                                                      .sisa.isNotEmpty &&
                                                  controller.sisa.length >
                                                      index)
                                              ? Visibility(
                                                  visible: true,
                                                  child: Text(
                                                    (controller.sisa[
                                                            datas[index].id][1])
                                                        ? "Benar"
                                                        : (controller
                                                                    .sisa[datas[
                                                                        index]
                                                                    .id][0] <
                                                                1
                                                            ? "Salah"
                                                            : "Sisa ${controller.sisa[datas[index].id][0]}"),
                                                    style: TextStyle(
                                                      color: controller.sisa[
                                                              datas[index]
                                                                  .id][1]
                                                          ? Colors.greenAccent
                                                          : Colors.redAccent,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                )
                                              : null,
                                          onTap: () {
                                            var id = datas[index].id;
                                            var arg = {
                                              "id_user": Get.arguments,
                                              "id_soal": id,
                                            };

                                            if (controller.user.isNotEmpty) {
                                              if (controller.user['video'] >
                                                  1) {
                                                // if (controller.sisa[
                                                //         datas[index].id][0] <
                                                //     1) {
                                                //   return;
                                                // }
                                                if (index > 0) {
                                                  for (var element in controller
                                                      .userAnswer) {
                                                    if (datas[index - 1].id ==
                                                        element['idSoal']) {
                                                      if (element['isTrue'] ||
                                                          element['numberofanswers'] > 2) {
                                                        if (!controller
                                                            .userLevel
                                                            .containsKey(id)) {
                                                          Get.offAndToNamed(
                                                            Routes.SOAL,
                                                            arguments: arg,
                                                          );
                                                        } else {
                                                          if (!controller
                                                                      .userLevel[
                                                                  id] &&
                                                              controller.sisa[
                                                                      id][0] >
                                                                  0) {
                                                            Get.offAndToNamed(
                                                              Routes.SOAL,
                                                              arguments: arg,
                                                            );
                                                          } else {
                                                            var a = controller
                                                                .userSelected[id];
                                                            Get.offAndToNamed(
                                                              Routes.FINISH,
                                                              arguments: {
                                                                ...arg,
                                                                "answer": a,
                                                              },
                                                            );
                                                          }
                                                        }
                                                      } else {
                                                        UI.warning(
                                                          msg:
                                                              "Selesaikan soal sebelumnya",
                                                        );
                                                      }
                                                    }
                                                  }
                                                  if (controller
                                                      .userAnswer.isEmpty) {
                                                    UI.warning(
                                                      msg:
                                                          "Selesaikan soal sebelumnya",
                                                    );
                                                  }
                                                } else {
                                                  if (!controller.userLevel
                                                      .containsKey(id)) {
                                                    Get.offAndToNamed(
                                                      Routes.SOAL,
                                                      arguments: arg,
                                                    );
                                                  } else {
                                                    if (!controller
                                                        .userLevel[id]) {
                                                      Get.offAndToNamed(
                                                        Routes.SOAL,
                                                        arguments: arg,
                                                      );
                                                    } else {
                                                      Get.offAndToNamed(
                                                        Routes.FINISH,
                                                        arguments: {
                                                          ...arg,
                                                          "answer": controller
                                                              .userSelected[id],
                                                        },
                                                      );
                                                    }
                                                  }
                                                }
                                              } else {
                                                UI.warning(
                                                  msg:
                                                      "Anda harus menonton Video 1 dan 2 terlebih dahulu",
                                                );
                                              }
                                            }
                                          },
                                          tileColor: UI.foreground,
                                          title: Text(
                                            "Nomor ${index + 1} ",
                                            style: const TextStyle(
                                              color: UI.action,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
          Menu.user,
        ],
      ),
    );
  }
}
