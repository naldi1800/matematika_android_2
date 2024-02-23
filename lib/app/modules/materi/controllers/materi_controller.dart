import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MateriController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot<Map<String, dynamic>>> getData() {
    var s = firestore.collection('soals');
    return s.snapshots();
  }

  var onLoad = false.obs;
  RxMap<String, dynamic> sisa = RxMap<String, dynamic>();
  RxList<dynamic> userAnswer = [].obs;
  RxMap<String, dynamic> userLevel = RxMap<String, dynamic>({});
  RxMap<String, dynamic> userSelected = RxMap<String, dynamic>({});
  RxMap<String, dynamic> user = RxMap<String, dynamic>({});
  void userData() {
    var u = firestore.collection('users').doc(Get.arguments);
    u.get().then((value) => user.value = value.data()!);
    u.collection('answers').get().then(
      (value) {
        sisa.value = RxMap<String, dynamic>();
        // var i = 0;
        if (value.docs.isNotEmpty) {
          for (var doc in value.docs) {
            var d = doc.data();
            userAnswer.add(d);
            userLevel.putIfAbsent(d['idSoal'], () => d['isTrue']);
            userSelected.putIfAbsent(d['idSoal'], () => d['answer']);
            sisa.putIfAbsent(
              d['idSoal'],
              () => [3 - d['numberofanswers'], d['isTrue']],
            );
            // i++;
          }
        }
        onLoad.value = true;
      },
    );
  }
}
