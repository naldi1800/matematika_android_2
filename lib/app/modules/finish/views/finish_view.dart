import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:matematika/app/routes/app_pages.dart';
import 'package:matematika/app/util/ui.dart';

import '../controllers/finish_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class FinishView extends GetView<FinishController> {
  const FinishView({super.key});
  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Penjelasan',
          style: TextStyle(color: UI.action),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: UI.action,
          ),
          onPressed: () {
            Get.offAndToNamed(Routes.MATERI, arguments: Get.arguments['id_user']);
          },
        ),
        centerTitle: true,
        backgroundColor: UI.foreground,
      ),
      backgroundColor: UI.backgroud,
      body: StreamBuilder(
          stream: controller.getData(Get.arguments['id_soal']),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              var datas = snapshot.data!;
              // print(datas.length);
              return Obx(() {
                var d = datas.data();

                controller.change(d!['q1'], d['q2']);
                var per1 =
                    "${d['q1'][0]}x ${d['q1'][3]} ${d['q1'][1]}y = ${d['q1'][2]}";
                var per2 =
                    "${d['q2'][0]}x ${d['q2'][3]} ${d['q2'][1]}y = ${d['q2'][2]}";

                final List<XYData> xydata1 = <XYData>[
                  XYData(controller.p1[0][0], controller.p1[0][1]),
                  XYData(controller.p1[1][0], controller.p1[1][1]),
                ];
                final List<XYData> xydata2 = <XYData>[
                  XYData(controller.p2[0][0], controller.p2[0][1]),
                  XYData(controller.p2[1][0], controller.p2[1][1]),
                ];
                controller.changeNumber.value = false;
                // print(xydata1);
                // print(xydata2);F
                if (controller.changeNumber.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      const SizedBox(height: 5),
                      Container(
                        width: double.infinity,
                        height: 100,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Jika $per1 dan $per2 maka x dan y adalah ?",
                          style: const TextStyle(
                            color: UI.action,
                            fontSize: 20,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 100,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Jawaban benar adalah (${d['answer']}. ${d[d['answer'].toString().toLowerCase()]}, jawaban anda ${Get.arguments["answer"]}",
                          style: TextStyle(
                            color: (Get.arguments["answer"] == d['answer'])
                                ? UI.action
                                : Colors.red,
                            fontSize: 20,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        // height: 500,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: HtmlWidget(
                          "${d['penj']}<br>",
                          textStyle:
                              const TextStyle(color: UI.action, fontSize: 15),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        // height: 500,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                          "Metode Grafik:",
                          style: TextStyle(color: UI.action, fontSize: 15),
                        ),
                      ),
                      Container(
                        width: 300,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: SfCartesianChart(
                          primaryXAxis: const NumericAxis(),
                          series: <CartesianSeries>[
                            LineSeries<XYData, double>(
                              dataSource: xydata1,
                              color: Colors.blue,
                              xValueMapper: (XYData d, _) => d.x,
                              yValueMapper: (XYData d, _) => d.y,
                            ),
                            LineSeries<XYData, double>(
                              dataSource: xydata2,
                              color: Colors.green,
                              xValueMapper: (XYData d, _) => d.x,
                              yValueMapper: (XYData d, _) => d.y,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

class XYData {
  XYData(this.x, this.y);
  final double x;
  final double y;
}
