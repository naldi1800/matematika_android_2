import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:matematika/app/routes/app_pages.dart';
import 'package:matematika/app/util/menu.dart';
import 'package:matematika/app/util/ui.dart';

import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  const UserView({super.key});
  @override
  Widget build(BuildContext context) {
    var layar = MediaQuery.of(context).size;
    var cardWitdh = (layar.width / 4) + (layar.width / 2) + (layar.width / 10);

    return Scaffold(
      backgroundColor: UI.backgroud,
      body: SafeArea(
        child: Stack(
          children: [
            StreamBuilder(
              stream: controller.getData(),
              builder: (context, snapshot) {
                print(snapshot.connectionState);
                if (snapshot.connectionState == ConnectionState.active) {
                  var datas = snapshot.data!.docs;
                  print("data: ${datas.length}");
                  return Column(
                    children: [
                      const SizedBox(height: 5),
                      Container(
                        color: UI.foreground,
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(),
                            const Text(
                              "Soal",
                              style: TextStyle(
                                color: UI.action,
                                fontSize: 25,
                              ),
                            ),
                            IconButton(
                              onPressed: () => Get.toNamed(Routes.ADD_SOAL),
                              icon: const Icon(
                                Icons.add,
                                color: UI.action,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: datas.length,
                          itemBuilder: (context, index) {
                            var d = datas[index].data();
                            // var per1 =
                            //     "${d['q1'][0]}X ${d['q1'][3]} ${d['q1'][1]}Y = ${d['q1'][2]}";
                            // var per2 =
                            //     "${d['q2'][0]}X ${d['q2'][3]} ${d['q2'][1]}Y = ${d['q2'][2]}";
                            var id = datas[index].id;
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ListTile(
                                tileColor: UI.object,
                                title: Text(
                                  "${d['name']}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: UI.action,
                                  ),
                                ),
                                subtitle: Text(
                                  "${d['email']} | Nilai : ${(d['isTest']) ? d['value'] : 'Belum test'}",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: UI.action,
                                  ),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        color: UI.action,
                                      ),
                                      onPressed: () => Get.toNamed(
                                        Routes.EDIT_SOAL,
                                        arguments: id,
                                      ),
                                    ),
                                    // IconButton(
                                    //   icon: const Icon(
                                    //     Icons.delete,
                                    //     color: Colors.redAccent,
                                    //   ),
                                    //   onPressed: () {},
                                    // ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.ADD_SOAL);
                        },
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.greenAccent),
                        ),
                        child: SizedBox(
                          width: cardWitdh,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Tambah",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            Menu.admin,
          ],
        ),
      ),
    );
  }
}
