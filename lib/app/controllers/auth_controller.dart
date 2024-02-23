// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:matematika/app/routes/app_pages.dart';
import 'package:matematika/app/util/ui.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore fire = FirebaseFirestore.instance;
  Stream<User?> get authStreamStatus => auth.authStateChanges();

  void login(emailAddress, password) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      // if (!credential.user!.emailVerified) {
      // if (false) {
      //   credential.user!.sendEmailVerification();
      //   await auth.signOut();
      //   UI.warning(
      //     msg: "Your email is not verify",
      //     confirmText: "Verify",
      //     // action: Get.offAllNamed(Routes.LOGIN),
      //   );
      // } else {}
      if (credential.user!.email == "admin@mtk.com") {
        Get.offAllNamed(Routes.ADMIN_HOME);
      } else {
        Get.offAllNamed(Routes.HOME, arguments: credential.user!.uid);
      }
      // }

      // print(credential!.);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        UI.warning(msg: "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        UI.warning(msg: "Wrong password provided for that user.");
      }
    }
  }

  void signUpWithPass(name, emailAddress, password) async {
    try {
      final created = await auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      UI.warning(msg: "Sign Up Success", title: "Info");
      CollectionReference users = fire.collection("users");
      await users.doc(created.user!.uid).set({
        "name": name,
        "email": emailAddress,
        "isTest": false,
        "answer": FieldValue.arrayUnion([]),
        "value": 0,
      });
      print("$created.user!.uid");
      Get.offAllNamed(Routes.HOME, arguments: created.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        UI.warning(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        UI.warning(msg: 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void logout() async {
    await auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
