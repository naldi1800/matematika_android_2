import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:matematika/app/util/ui.dart';

class AdminSoalController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot<Map<String, dynamic>>> getData() {
    var soal = firestore.collection('soals');
    return soal.snapshots();
  }

  void delete(id) async {
    var u = await firestore.collection("users").get();
    for (var usr in u.docs) {
      var usrId = usr.id;
      var usrAnswer = await firestore
          .collection("users")
          .doc(usrId)
          .collection("answers")
          .get();
      for (var usra in usrAnswer.docs) {
        await usra.reference.delete();
      }
    }

    var soal = firestore.collection('soals').doc(id);
    soal.delete();
    UI.warning(msg: "Berhasil dihapus");
  }
}
