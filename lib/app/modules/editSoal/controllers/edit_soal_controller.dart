import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matematika/app/routes/app_pages.dart';

class EditSoalController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<TextEditingController> cQ1 = [];
  List<TextEditingController> cQ2 = [];
  // TextEditingController cAnswer = TextEditingController();
  // TextEditingController cOptA = TextEditingController();
  // TextEditingController cOptB = TextEditingController();
  // TextEditingController cOptC = TextEditingController();
  // TextEditingController cOptD = TextEditingController();

  // TextEditingController cCerita = TextEditingController();
  // TextEditingController cPenjelasan = TextEditingController();
  var load = false.obs;

  var nama = [
    "Adi",
    "Budi",
    "Citra",
    "Dewi",
    "Eka",
    "Fitri",
    "Gita",
    "Hadi",
    "Ika",
    "Joko",
    "Krisna",
    "Lia",
    "Mega",
    "Nina",
    "Oscar",
    "Putri",
    "Rudi",
    "Sari",
    "Tono",
    "Umi",
    "Vina",
    "Wawan",
    "Xena",
    "Yanti",
    "Zain",
    "Abdul",
    "Bambang",
    "Cindy",
    "Diana",
    "Edo"
  ];

  var barang = [
    "Buku Tulis",
    "Pensil",
    "Pulpen",
    "Penghapus",
    "Pensil Warna",
    "Rautan",
    "Spidol",
    "Tas Sekolah",
    "Penggaris",
    "Pita Warna",
    "Tempat Pensil",
    "Buku Gambar",
    "Kalkulator",
    "Map Pelajaran",
    "Botol Minum",
    "Laptop",
    "Kartu Nama",
    "Stiker Nama",
    "Map Kertas",
    "Lem Stick"
  ];

  @override
  void onInit() {
    clear();
    super.onInit();
  }

  void clear() {
    // cAnswer.text = cOptA.text = cOptB.text = cOptC.text = cOptD.text = "";

    cQ1 = List.generate(4, (index) => TextEditingController());
    cQ2 = List.generate(4, (index) => TextEditingController());
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getData(id) async {
    var soal = firestore.collection('soals').doc(id);
    return soal.get();
  }

  Future setData() async {
    var soal = firestore.collection('soals').doc(Get.arguments);
    soal.get().then((value) {
      var datas = value.data() as Map<String, dynamic>;
      var q1 = datas['q1'];
      var q2 = datas['q2'];
      cQ1[0].text = "${q1[0]}";
      cQ2[0].text = "${q2[0]}";
      cQ1[1].text = "${q1[1]}";
      cQ2[1].text = "${q2[1]}";
      cQ1[2].text = "${q1[2]}";
      cQ2[2].text = "${q2[2]}";
      cQ1[3].text = "${q1[3]}";
      cQ2[3].text = "${q2[3]}";
      // cOptA.text = datas['a'];
      // cOptB.text = datas['b'];
      // cOptC.text = datas['c'];
      // cOptD.text = datas['d'];
      // cPenjelasan.text = datas['penj'];
      // cCerita.text = datas['cerita'];
      // cAnswer.text = datas['answer'];
      load.value = true;
    });
  }

  // Future save(id) {
  //   var soal = firestore.collection('soals').doc(id);
  //   var q1 = [
  //     int.parse(cQ1[0].text),
  //     int.parse(cQ1[1].text),
  //     int.parse(cQ1[2].text),
  //     cQ1[3].text
  //   ];
  //   var q2 = [
  //     int.parse(cQ2[0].text),
  //     int.parse(cQ2[1].text),
  //     int.parse(cQ2[2].text),
  //     cQ2[3].text
  //   ];
  //   var data = {
  //     'q1': FieldValue.arrayUnion(q1),
  //     'q2': FieldValue.arrayUnion(q2),
  //     'a': cOptA.text,
  //     'b': cOptB.text,
  //     'c': cOptC.text,
  //     'd': cOptD.text,
  //     'answer': cAnswer.text,
  //     'penj': cPenjelasan.text,
  //     'cerita': cCerita.text,
  //   };
  //   clear();
  //   Get.offAndToNamed(Routes.ADMIN_SOAL);
  //   return soal.update(data);
  // }

  Future saved(id) {
    var q1 = [
      int.parse(cQ1[0].text),
      int.parse(cQ1[1].text),
      int.parse(cQ1[2].text),
      cQ1[3].text
    ];
    var q2 = [
      int.parse(cQ2[0].text),
      int.parse(cQ2[1].text),
      int.parse(cQ2[2].text),
      cQ2[3].text
    ];
    List<String> opt = ["", "", "", ""];
    var an = generateAnswer(q1, q2, opt);
    var answer = an[2];
    var sub = an[0], eli = an[1];
    var soal = firestore.collection('soals').doc(id);
    var data = {
      'q1': FieldValue.arrayUnion(q1),
      'q2': FieldValue.arrayUnion(q2),
      'a': opt[0],
      'b': opt[1],
      'c': opt[2],
      'd': opt[3],
      'answer': answer,
      'penj': "$sub\n$eli",
      'cerita': generateCerita(q1, q2),
    };
    clear();
    Get.offAndToNamed(Routes.ADMIN_SOAL);
    return soal.update(data);
  }

  String generateCerita(p1, p2) {
    var n1 = nama[Random().nextInt(nama.length)];
    int indexN2;
    do {
      indexN2 = Random().nextInt(barang.length);
    } while (indexN2 == barang.indexOf(n1));
    var n2 = nama[indexN2];

    var b1 = barang[Random().nextInt(barang.length)];
    int indexB2;
    do {
      indexB2 = Random().nextInt(barang.length);
    } while (indexB2 == barang.indexOf(b1));
    var b2 = barang[indexB2];

    var text =
        "$n1 membeli ${p1[0]} $b1 dan ${p1[1]} $b2 dengan harga Rp${p1[2]}.000 sedangkan $n2 membeli ${p2[0]} $b1 dan ${p2[1]} $b2 dengan harga Rp${p2[2]}.000,  berapa harga masing-masing barang?";

    return text;
  }

  List<String> generateAnswer(p1, p2, List<String> opt) {
    int a1 = p1[0], b1 = p1[1], c1 = p1[2]; // Koefisien persamaan pertama
    int a2 = p2[0], b2 = p2[1], c2 = p2[2]; // Koefisien persamaan kedua
    var subti = "Metode Substitusi: <br>", elimi = "<br>Metode Eliminasi: <br>";
    // Metode Substitusi
    // print("Metode Substitusi:");
    List<String> stepsSubstitusi = [];
    List<int> xySub = [];
    substitusi(a1, b1, c1, a2, b2, c2, stepsSubstitusi, xySub);
    for (var step in stepsSubstitusi) {
      subti += "$step <br>";
    }

    // Metode Eliminasi
    // print("\nMetode Eliminasi:");
    List<String> stepsEliminasi = [];
    List<int> xyEli = [];
    eliminasi(a1, b1, c1, a2, b2, c2, stepsEliminasi, xyEli);
    for (var step in stepsEliminasi) {
      elimi += "$step <br>";
    }
    var ind = Random().nextInt(4);
    var answer = String.fromCharCode('A'.codeUnitAt(0) + ind);
    // print(answer);
    if (xySub[0] == xyEli[0] && xySub[1] == xyEli[1]) {
      for (var i = 0; i < opt.length; i++) {
        if (ind == i) {
          opt[i] = "(${xySub[0]}, ${xySub[1]})";
        } else {
          int x, y;
          x = Random().nextInt(xySub[0] + 5) + xySub[0] - 5;
          y = Random().nextInt(xySub[1] + 5) + xySub[1] - 5;
          opt[i] = "($x , $y)";
        }
      }
    } else {
      for (var i = 0; i < opt.length; i++) {
        if (ind == i) {
          opt[i] = "(${xySub[0]}, ${xySub[1]}) atau (${xyEli[0]}, ${xyEli[1]})";
        } else {
          int x, y, x2, y2;
          x = Random().nextInt(xySub[0] + 5) + xySub[0] - 5;
          y = Random().nextInt(xySub[1] + 5) + xySub[1] - 5;
          x2 = Random().nextInt(xyEli[0] + 5) + xyEli[0] - 5;
          y2 = Random().nextInt(xyEli[1] + 5) + xyEli[1] - 5;
          opt[i] = "($x , $y) atau ($x2, $y2)";
        }
      }
    }
    return [subti, elimi, answer];
  }

  void eliminasi(int a1, int b1, int c1, int a2, int b2, int c2,
      List<String> steps, List<int> xy) {
    // Menampilkan persamaan awal
    steps.add("Persamaan pertama: ${a1}x + ${b1}y = $c1");
    steps.add("Persamaan kedua  : ${a2}x + ${b2}y = $c2");

    // Menggunakan eliminasi untuk mendapatkan nilai y
    int y = ((c1 * a2 - c2 * a1) ~/
        (b1 * a2 - b2 * a1)); // menggunakan operator ~/ untuk pembagian bulat
    steps.add("Langkah 1: Gunakan eliminasi untuk mendapatkan nilai y");
    steps.add(
        "   y = ($c1 * $a2 - $c2 * $a1) / ($b1 * $a2 - $b2 * $a1)");
    steps.add("   y = $y");

    // Menggunakan nilai y untuk mendapatkan nilai x
    int x =
        (c1 - b1 * y) ~/ a1; // menggunakan operator ~/ untuk pembagian bulat
    steps.add("Langkah 2: Gunakan nilai y untuk mendapatkan nilai x");
    steps.add("   x = ($c1 - ${b1}y) / $a1");
    steps.add("   x = $x");

    // Menampilkan solusi
    steps.add("Solusi:");
    steps.add("   x = $x");
    steps.add("   y = $y");

    xy.add(x);
    xy.add(y);
  }

  void substitusi(int a1, int b1, int c1, int a2, int b2, int c2,
      List<String> steps, List<int> xy) {
    // Menampilkan persamaan awal
    steps.add("Persamaan pertama: ${a1}x + ${b1}y = $c1");
    steps.add("Persamaan kedua  : ${a2}x + ${b2}y = $c2");

    // Menyelesaikan persamaan pertama untuk y
    int y = getY(a1, b1, c1, a2, b2, c2);
    steps.add("Langkah 1: Selesaikan persamaan pertama untuk y");
    steps.add("   ${b1}y = $c1 - ${a1}x");
    steps.add("   y = ($c1 - ${a1}x) / $b1");
    steps.add("   y = $y");

    // Menggunakan nilai y untuk mendapatkan nilai x
    int x = getX(a2, b2, c2, y);
    steps.add("Langkah 2: Gunakan nilai y untuk mendapatkan nilai x");
    steps.add("   ${a2}x = $c2 - ${b2}y");
    steps.add("   x = ($c2 - ${b2}y) / $a2");
    steps.add("   x = $x");

    // Menampilkan solusi
    steps.add("Solusi:");
    steps.add("   x = $x");
    steps.add("   y = $y");
    xy.add(x);
    xy.add(y);
  }

  int getY(int a1, int b1, int c1, int a2, int b2, int c2) {
    // Menyelesaikan persamaan pertama untuk y
    return ((c1 * b2) - (c2 * b1)) ~/ ((a1 * b2) - (a2 * b1));
  }

  int getX(int a2, int b2, int c2, int y) {
    // Menggunakan nilai y untuk mendapatkan nilai x
    return (c2 - (b2 * y)) ~/ a2;
  }
}
