import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var isTest = false.obs;
  var onLoad = false.obs;
  Stream<DocumentSnapshot<Map<String, dynamic>>> getData(id) {
    var u = firestore.collection('users').doc(id);
    return u.snapshots();
  }

  var skor = 0.0;
  void setData() {
    var b = 0;
    firestore
        .collection('users')
        .doc(Get.arguments)
        .collection('answers')
        .get()
        .then((value) {
      for (var element in value.docs) {
        if (element['isTrue']) {
          b += 1;
        } 
      }
      var sLen = 0;
      firestore.collection('soals').get().then((value) {
        sLen = value.docs.length;
        skor = (b / (sLen)) * 100;
        onLoad.value = true;
      });
    });
  }
}
