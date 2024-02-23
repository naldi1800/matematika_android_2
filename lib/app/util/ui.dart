import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UI {
  static const backgroud = Color(0xff053B50);
  static const Color foreground = Color(0xff176B87);
  static const Color object = Color(0xff64CCC5);
  static const Color action = Color(0xffEEEEEE);

  static OutlineInputBorder border(
      {double witdh = 1.0, color = Colors.transparent, double radius = 0.0}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: witdh,
        color: color,
      ),
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static Center textInput(TextEditingController c,
      {required String label, color = Colors.cyan, mLine = 1, bool expand = false}) {
    var radiusBorder = 25.0;
    return Center(
      child: TextFormField(
        controller: c,
        maxLines: mLine,
        expands: expand,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: UI.action),
          filled: true,
          fillColor: UI.foreground,
          border: border(radius: radiusBorder),
          focusedBorder: border(
            radius: radiusBorder,
            color: color,
          ),
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }

  static Future dialogMenu() {
    return Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Material(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        "Title Text",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "Message Text",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      //Buttons
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(0, 45),
                                // primary: Colors.amber,
                                // onPrimary: const Color(0xFFFFFFFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'NO',
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(0, 45),
                                // primary: Colors.amber,
                                // onPrimary: const Color(0xFFFFFFFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'YES',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void warning(
      {required msg,
      title = "Warning",
      confirmText = "Ok",
      void Function()? action}) {
    Get.defaultDialog(
      backgroundColor: foreground,
      title: "$title",
      middleText: "$msg",
      textConfirm: "$confirmText",
      titleStyle: const TextStyle(color: object, fontSize: 25),
      middleTextStyle: const TextStyle(color: object, fontSize: 15),
      onConfirm: () {
        if (confirmText != "Ok") {
          action!.call();
        }
        Get.back();
      },
    );
  }

  static void danger(
      {required msg,
      title = "Warning",
      confirmText = "Ok",
      void Function()? action}) {
    Get.defaultDialog(
      backgroundColor: foreground,
      title: "$title",
      middleText: "$msg",
      textConfirm: "$confirmText",
      textCancel: "Cancel",
      confirmTextColor: const Color(0xffff00000),
      titleStyle: const TextStyle(color: object, fontSize: 25),
      middleTextStyle: const TextStyle(color: object, fontSize: 15),
      onConfirm: () {
        if (confirmText != "Ok") {
          print(confirmText);
          action!.call();
        }
        Get.back();
      },
    );
  }

  static Widget perInput(List<TextEditingController> c) {
    return Row(
      children: [
        SizedBox(
          width: 70,
          child: TextFormField(
            controller: c[0],
            decoration: InputDecoration(
              labelText: "X",
              labelStyle: const TextStyle(color: UI.action),
              filled: true,
              fillColor: UI.foreground,
              border: UI.border(radius: 25.0),
              focusedBorder: UI.border(
                radius: 25.0,
                color: Colors.cyan,
              ),
            ),
            keyboardType: TextInputType.text,
          ),
        ),
        SizedBox(
          width: 70,
          child: TextFormField(
            controller: c[1],
            decoration: InputDecoration(
              labelText: "Y",
              labelStyle: const TextStyle(color: UI.action),
              filled: true,
              fillColor: UI.foreground,
              border: UI.border(radius: 25.0),
              focusedBorder: UI.border(
                radius: 25.0,
                color: Colors.cyan,
              ),
            ),
            keyboardType: TextInputType.text,
          ),
        ),
        SizedBox(
          width: 70,
          child: TextFormField(
            controller: c[3],
            decoration: InputDecoration(
              labelText: "Opt",
              labelStyle: const TextStyle(color: UI.action),
              filled: true,
              fillColor: UI.foreground,
              border: UI.border(radius: 25.0),
              focusedBorder: UI.border(
                radius: 25.0,
                color: Colors.cyan,
              ),
            ),
            keyboardType: TextInputType.text,
          ),
        ),
        SizedBox(
          width: 70,
          child: TextFormField(
            controller: c[2],
            decoration: InputDecoration(
              labelText: "Z",
              labelStyle: const TextStyle(color: UI.action),
              filled: true,
              fillColor: UI.foreground,
              border: UI.border(radius: 25.0),
              focusedBorder: UI.border(
                radius: 25.0,
                color: Colors.cyan,
              ),
            ),
            keyboardType: TextInputType.text,
          ),
        ),
      ],
    );
  }
}
