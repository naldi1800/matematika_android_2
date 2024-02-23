import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:matematika/app/controllers/auth_controller.dart';

import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//   runApp(
//     GetMaterialApp(
//       title: "Application",
//       initialRoute: AppPages.INITIAL,
//       getPages: AppPages.routes,
//       debugShowCheckedModeBanner: false,
//     ),
//   );
  runApp(MainClass());
}

class MainClass extends StatelessWidget {
  MainClass({super.key});
  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.authStreamStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          // print(snapshot.hasData);
          if (snapshot.hasData) {
            print(snapshot.data!.email);

            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              Get.offAllNamed(
                (snapshot.data!.email == "admin@mtk.com")
                    ? Routes.ADMIN_HOME
                    : Routes.HOME,
                arguments: snapshot.data!.uid,
              );
            });
            // return GetMaterialApp(
            //   title: "Application",
            //   initialRoute: snapshot.data!.email == "admin@mtk.com"
            //       ? Routes.ADMIN_HOME
            //       : Routes.HOME,
            //       // routes: snapshot.data!.email == "admin@mtk.com" ? AdminHomeView() : HomeView(),
            //   getPages: AppPages.routes,
            //   debugShowCheckedModeBanner: false,
            // );
          }
          return GetMaterialApp(
            title: "Application",
            initialRoute: Routes.LOGIN,
            getPages: AppPages.routes,
            debugShowCheckedModeBanner: false,
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
