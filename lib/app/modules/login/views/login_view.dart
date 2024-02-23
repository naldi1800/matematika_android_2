import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:matematika/app/controllers/auth_controller.dart';
import 'package:matematika/app/routes/app_pages.dart';
import 'package:matematika/app/util/ui.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    AuthController auth = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: UI.backgroud,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 105),

                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Welcome Back!",
                    style: TextStyle(color: UI.object, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 15),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Please sign in to your account",
                    style: TextStyle(color: UI.action, fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  height: 65,
                  child: TextFormField(
                    controller: controller.cUser,
                    style: const TextStyle(color: UI.object, fontSize: 15),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: UI.foreground),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      fillColor: UI.foreground,
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                //PASSWORD
                Obx(
                  () => SizedBox(
                    height: 65,
                    width: double.infinity,
                    child: TextFormField(
                      controller: controller.cPass,
                      style: const TextStyle(color: UI.object, fontSize: 15),
                      obscureText: controller.showPass.value,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: UI.foreground),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: UI.foreground,
                        suffixIcon: IconButton(
                          icon: Icon(controller.showPass.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            controller.showPass.value =
                                !controller.showPass.value;
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                // const SizedBox(height: 5),
                // SizedBox(
                //   width: double.infinity,
                //   child: TextButton(
                //     onPressed: () {},
                //     style: const ButtonStyle(alignment: Alignment.centerRight),
                //     child: Text(
                //       "Forgot Password",
                //       textAlign: TextAlign.right,
                //       style: TextStyle(
                //         fontSize: 15,
                //         color: UI.action,
                //       ),
                //     ),
                //   ),
                // ),
                const SizedBox(height: 25),
                SizedBox(
                  height: 65,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => auth.login(
                        controller.cUser.text, controller.cPass.text),
                    style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(UI.action),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                      child: Text("Sign In With Admin"),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Visibility(
                  visible: true,
                  child: SizedBox(
                    height: 65,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        auth.login("user1@mtk.com", "123456");
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(UI.object),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                        child: Text(
                          "Sign in with User",
                          style: TextStyle(color: UI.foreground),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an Account?",
                        style: TextStyle(color: UI.object, fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                      TextButton(
                        onPressed: () => Get.offAndToNamed(Routes.SIGN_UP),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: UI.action, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
