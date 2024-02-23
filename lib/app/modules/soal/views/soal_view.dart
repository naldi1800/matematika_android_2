import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:matematika/app/routes/app_pages.dart';
// import 'package:matematika/app/util/menu.dart';
import 'package:matematika/app/util/ui.dart';

import '../controllers/soal_controller.dart';
import 'package:whiteboard/whiteboard.dart';
// import 'package:whiteboard_sdk_flutter/whiteboard_sdk_flutter.dart';

class SoalView extends GetView<SoalController> {
  const SoalView({super.key});
  @override
  Widget build(BuildContext context) {
    var layar = MediaQuery.of(context).size;
    var cardWitdh = (layar.width / 4) + (layar.width / 2) + (layar.width / 10);
    var optHeight = 50.0;
    double fontSizeAnswer = 25;
    // WhiteBoardController papan = WhiteBoardController();
    WhiteBoardController papan = WhiteBoardController();

    var ukuranPensil = 4.0.obs;
    var ukuranPensilOld = 4.0.obs;
    var sp = true.obs;
    var erase = false.obs;
    print(Get.arguments);
    return Scaffold(
      backgroundColor: UI.backgroud,
      body: SafeArea(
        child: Stack(
          children: [
            //UTAMA
            Container(
              width: double.infinity,
              height: layar.height / 3,
              decoration: const BoxDecoration(
                color: UI.foreground,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
            ),
            StreamBuilder(
                stream: controller.getData(Get.arguments['id_soal']),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    var datas = snapshot.data!;
                    var d = datas.data();
                    // print(d);
                    // return Container();
                    return Obx(
                      () => Stack(
                        children: [
                          // Quis
                          Visibility(
                            visible: !controller.isFinish.value,
                            child: SingleChildScrollView(
                              physics: (sp.value)
                                  ? const AlwaysScrollableScrollPhysics()
                                  : const NeverScrollableScrollPhysics(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 35),
                                  Container(
                                    width: cardWitdh,
                                    height: layar.height / 3,
                                    decoration: const BoxDecoration(
                                      color: UI.object,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SingleChildScrollView(
                                          child: Text(
                                            "${d!['cerita']}",
                                            style: const TextStyle(
                                                overflow: TextOverflow.clip,
                                                fontSize: 15,
                                                color: UI.action),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  GestureDetector(
                                    onTap: () => controller.setSelected("A"),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: optHeight,
                                      width: cardWitdh,
                                      decoration: BoxDecoration(
                                        color: UI.action,
                                        border: Border.all(
                                          color: (controller.selected.value ==
                                                      "A" ||
                                                  controller.answer.value ==
                                                      "A")
                                              ? Colors.green
                                              : Colors.transparent,
                                          width: 3,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(25),
                                        ),
                                      ),
                                      child: Text(
                                        d['a'].toString(),
                                        style: TextStyle(
                                          overflow: TextOverflow.clip,
                                          fontSize: fontSizeAnswer,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: () => controller.setSelected("B"),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: optHeight,
                                      width: cardWitdh,
                                      decoration: BoxDecoration(
                                        color: UI.action,
                                        border: Border.all(
                                          color: (controller.selected.value ==
                                                      "B" ||
                                                  controller.answer.value ==
                                                      "B")
                                              ? Colors.green
                                              : Colors.transparent,
                                          width: 3,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(25),
                                        ),
                                      ),
                                      child: Text(
                                        d['b'].toString(),
                                        style: TextStyle(
                                          overflow: TextOverflow.clip,
                                          fontSize: fontSizeAnswer,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: () => controller.setSelected("C"),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: optHeight,
                                      width: cardWitdh,
                                      decoration: BoxDecoration(
                                        color: UI.action,
                                        border: Border.all(
                                          color: (controller.selected.value ==
                                                      "C" ||
                                                  controller.answer.value ==
                                                      "C")
                                              ? Colors.green
                                              : Colors.transparent,
                                          width: 3,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(25),
                                        ),
                                      ),
                                      child: Text(
                                        d['c'].toString(),
                                        style: TextStyle(
                                          overflow: TextOverflow.clip,
                                          fontSize: fontSizeAnswer,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: () => controller.setSelected("D"),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: optHeight,
                                      width: cardWitdh,
                                      decoration: BoxDecoration(
                                        color: UI.action,
                                        border: Border.all(
                                          color: (controller.selected.value ==
                                                      "D" ||
                                                  controller.answer.value ==
                                                      "D")
                                              ? Colors.green
                                              : Colors.transparent,
                                          width: 3,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(25),
                                        ),
                                      ),
                                      child: Text(
                                        d['d'].toString(),
                                        style: TextStyle(
                                          overflow: TextOverflow.clip,
                                          fontSize: fontSizeAnswer,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                  Container(
                                    alignment: Alignment.center,
                                    width: layar.width - (layar.width / 6),
                                    height: layar.height / 1.5,
                                    child: WhiteBoard(
                                      strokeWidth: ukuranPensil.value,
                                      isErasing: erase.value,
                                      controller: papan,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          sp.value = !sp.value;
                                        },
                                        icon: Icon(
                                          (sp.value)
                                              ? Icons.edit_note
                                              : Icons.close,
                                          color: (sp.value)
                                              ? UI.action
                                              : Colors.red,
                                        ),
                                      ),
                                      if (!sp.value)
                                        PopupMenuButton(
                                          initialValue:
                                              ukuranPensil.value.toString(),
                                          icon: Icon(
                                            Icons.circle,
                                            size: (ukuranPensil.value * 2.5),
                                            color: UI.action,
                                          ),
                                          itemBuilder: (c) => [
                                            PopupMenuItem(
                                              value: "slider",
                                              child: SizedBox(
                                                width: 200,
                                                child: Slider(
                                                  min: 1,
                                                  max: 10,
                                                  value: ukuranPensil.value,
                                                  secondaryTrackValue:
                                                      ukuranPensilOld.value,
                                                  label: ukuranPensil.value
                                                      .toString(),
                                                  onChanged: (double value) {
                                                    ukuranPensilOld.value =
                                                        ukuranPensil.value;
                                                    ukuranPensil.value = value;
                                                    Get.back();
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                          onSelected: (v) {
                                            if (v == "slider") {
                                              // Do any additional actions here if needed
                                            }
                                          },
                                        ),
                                      if (!sp.value)
                                        IconButton(
                                          onPressed: () {
                                            erase.value = !erase.value;
                                          },
                                          icon: Icon(
                                            (!erase.value)
                                                ? Icons.delete
                                                : Icons.edit,
                                            color: UI.action,
                                          ),
                                        ),
                                      if (!sp.value)
                                        IconButton(
                                          onPressed: () {
                                            papan.undo();
                                          },
                                          icon: const Icon(
                                            Icons.arrow_back,
                                            color: UI.action,
                                          ),
                                        ),
                                      if (!sp.value)
                                        IconButton(
                                          onPressed: () {
                                            papan.redo();
                                          },
                                          icon: const Icon(
                                            Icons.arrow_forward,
                                            color: UI.action,
                                          ),
                                        ),
                                      if (!sp.value)
                                        IconButton(
                                          onPressed: () {
                                            papan.clear();
                                          },
                                          icon: const Icon(
                                            Icons.clear_all,
                                            color: UI.action,
                                          ),
                                        ),
                                    ],
                                  ),
                                  ElevatedButton(
                                      onPressed: () async {
                                        int x = await controller.saveAnswer(
                                            controller.answer.value ==
                                                d['answer']);
                                        // print(controller.answer.value ==
                                        //     d['answer']);

                                        print(Get.arguments);
                                        if (x > 2 &&
                                            controller.answer.value !=
                                                d['answer']) {
                                          Get.offAndToNamed(Routes.FINISH,
                                              arguments: {
                                                "id_soal":
                                                    Get.arguments['id_soal'],
                                                "id_user":
                                                    Get.arguments['id_user'],
                                                "answer": controller.answer.value,
                                              });
                                          // UI.warning(
                                          //     msg:
                                          //         "Jawaban anda salah, Sisa kesempatan $x");
                                          // to penjelasan
                                        } else {
                                          // print(Get.arguments['id_user']);
                                          // Get.back();
                                          Get.offAndToNamed(Routes.MATERI,
                                              arguments:
                                                  Get.arguments['id_user']);
                                          // Get.offAndToNamed(Routes.MATERI,
                                          //     arguments:
                                          //         Get.arguments['id_user']);
                                          // UI.warning(msg: "Jawaban anda benar");
                                        }
                                      },
                                      style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                UI.foreground),
                                      ),
                                      child: const Text(
                                        "Jawab",
                                        style: TextStyle(
                                            color: UI.action, fontSize: 15),
                                      )),
                                  const SizedBox(height: 15),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),

            // Menu
            // Menu.user,
          ],
        ),
      ),
    );
  }
}
