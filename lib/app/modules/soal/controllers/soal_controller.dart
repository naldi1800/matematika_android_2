import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whiteboard/whiteboard.dart';

class SoalController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var currentQuiz = 0.obs;
  var isLastQuiz = false.obs;
  var answer = "".obs;
  var tf = "".obs;
  var selected = "".obs;
  var isFinish = false.obs;
  var isWhiteboard = false.obs;
  var showNumber = false.obs;

  RxList<WhiteBoardController> papan = RxList<WhiteBoardController>();
  // var papan = [].obs;

  Stream<DocumentSnapshot<Map<String, dynamic>>> getData(id) {
    var soal = firestore.collection('soals').doc(id);
    return soal.snapshots();
  }

  void setSelected(String s) {
    selected.value = s;
    answer.value = s;
  }

  Future<int> saveAnswer(bool isTrue) async {
    var answersCollection = firestore
        .collection('users')
        .doc(Get.arguments['id_user'])
        .collection('answers');

    try {
      var querySnapshot = await answersCollection.get();

      for (var doc in querySnapshot.docs) {
        print(doc);
        if (doc['idSoal'] == Get.arguments['id_soal']) {
          var number = doc['numberofanswers'] + 1;
          await answersCollection.doc(doc.id).update({
            "numberofanswers": number,
            "isTrue": isTrue,
            "answer": answer.value,
          });
          return number; // Break out of the loop after updating
        }
      }

      // If the loop completes without finding a matching document
      await answersCollection.add({
        "idSoal": Get.arguments['id_soal'],
        "numberofanswers": 1,
        "isTrue": isTrue,
        "answer": answer.value,
      });
    } catch (e) {
      print('Error saving answer: $e');
      // Handle the error accordingly
    }
    return 1;
  }

  // void saveAnswer(isTrue) async {
  //   firestore
  //       .collection('users')
  //       .doc(Get.arguments['id_user'])
  //       .collection('answers')
  //       .get()
  //       .then((value) {
  //     var x = false;
  //     value.docs.forEach(
  //       (doc) {
  //         print(doc);
  //         if (doc['idSoal'] == Get.arguments['id_soal']) {
  //           // print("ID: ${doc['idSoal']}");
  //           firestore
  //               .collection('users')
  //               .doc(Get.arguments['id_user'])
  //               .collection('answers')
  //               .doc(doc.id)
  //               .update({
  //             "numberofanswers": (doc['numberofanswers'] + 1),
  //             "isTrue": isTrue,
  //             "answer": answer.value,
  //           });
  //           // print("UY $uy");
  //           x = true;
  //         }
  //       },
  //     );
  //     // print(x);
  //     if (!x) {
  //       firestore
  //           .collection('users')
  //           .doc(Get.arguments['id_user'])
  //           .collection('answers')
  //           .add({
  //         "idSoal": Get.arguments['id_soal'],
  //         "numberofanswers": 1,
  //         "isTrue": isTrue,
  //         "answer": answer.value,
  //       });
  //     }
  //   });
  // }

  //   @override
  // void onInit() {
  //   super.onInit();
  //   loadDrawingDataFromStorage(WhiteBoardController());
  // }
  // @override
  // void dispose() {
  //   super.dispose();
  //   saveDrawingDataToStorage(WhiteBoardController());
  // }
  // void loadDrawingDataFromStorage(c) {
  //   // Handle potential errors and null cases
  //   final storedData = drawSave.get('drawing_data');
  //   if (storedData != null) {
  //     c.loadData(storedData);
  //   }
  // }
  // void saveDrawingDataToStorage(c) {
  //   // Save current drawing data to storage
  //   final data = c.getData();
  //   drawSave.put('drawing_data', data);
  // }
}
