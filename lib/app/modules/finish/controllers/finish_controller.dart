import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FinishController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var currentQuiz = 0.obs;
  var isLastQuiz = false.obs;
  var changeNumber = false.obs;

  var p1 = [
    [0.0, 0.0],
    [0.0, 0.0],
  ].obs;

  var p2 = [
    [0.0, 0.0],
    [0.0, 0.0],
  ].obs;

  Stream<DocumentSnapshot<Map<String, dynamic>>> getData(id ) {
    var soal = firestore.collection('soals').doc(id);
    return soal.snapshots();
  }

  void change(q1, q2) {
    var x1 = q1[0] + 0.0;
    var x2 = q2[0] + 0.0;

    var y1 = q1[1] + 0.0;
    var y2 = q2[1] + 0.0;

    var h1 = q1[2] + 0.0;
    var h2 = q2[2] + 0.0;

    var o1 = q1[3];
    var o2 = q2[3];

    p1.value = [
      [0, getY(y: y1, h: h1, o: o1)],
      [getX(x: x1, h: h1, o: o1), 0],
    ];
    p2.value = [
      [0, getY(y: y2, h: h2, o: o2)],
      [getX(x: x2, h: h2, o: o2), 0],
    ];
  }

  double getX({
    required double x,
    y = 0,
    required double h,
    required String o,
  }) {
    double hasil = 0;
    if (o == "+") {
      if (x == 1) {
        hasil = double.parse("$h");
      } else {
        // print(hasil);
        hasil = h / x;
      }
    }
    return hasil;
  }

  double getY({
    x = 0,
    required double y,
    required double h,
    required String o,
  }) {
    double hasil = 0;
    if (o == "+") {
      if (y == 1) {
        hasil = double.parse("$h");
      } else {
        hasil = h / y;
      }
    }
    return hasil;
  }
}
