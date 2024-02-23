import 'package:get/get.dart';

import '../modules/addSoal/bindings/add_soal_binding.dart';
import '../modules/addSoal/views/add_soal_view.dart';
import '../modules/adminHome/bindings/admin_home_binding.dart';
import '../modules/adminHome/views/admin_home_view.dart';
import '../modules/adminMateri/bindings/admin_materi_binding.dart';
import '../modules/adminMateri/views/admin_materi_view.dart';
import '../modules/adminSoal/bindings/admin_soal_binding.dart';
import '../modules/adminSoal/views/admin_soal_view.dart';
import '../modules/editSoal/bindings/edit_soal_binding.dart';
import '../modules/editSoal/views/edit_soal_view.dart';
import '../modules/finish/bindings/finish_binding.dart';
import '../modules/finish/views/finish_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/materi/bindings/materi_binding.dart';
import '../modules/materi/views/materi_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/signUp/bindings/sign_up_binding.dart';
import '../modules/signUp/views/sign_up_view.dart';
import '../modules/soal/bindings/soal_binding.dart';
import '../modules/soal/views/soal_view.dart';
import '../modules/user/bindings/user_binding.dart';
import '../modules/user/views/user_view.dart';
import '../modules/video/bindings/video_binding.dart';
import '../modules/video/views/video_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SOAL,
      page: () => const SoalView(),
      binding: SoalBinding(),
    ),
    GetPage(
      name: _Paths.ADD_SOAL,
      page: () => const AddSoalView(),
      binding: AddSoalBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_SOAL,
      page: () => const AdminSoalView(),
      binding: AdminSoalBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_SOAL,
      page: () => const EditSoalView(),
      binding: EditSoalBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_HOME,
      page: () => const AdminHomeView(),
      binding: AdminHomeBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_MATERI,
      page: () => const AdminMateriView(),
      binding: AdminMateriBinding(),
      children: [
        GetPage(
          name: _Paths.ADMIN_MATERI,
          page: () => const AdminMateriView(),
          binding: AdminMateriBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.MATERI,
      page: () => const MateriView(),
      binding: MateriBinding(),
    ),
    GetPage(
      name: _Paths.USER,
      page: () => const UserView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO,
      page: () => const VideoView(),
      binding: VideoBinding(),
    ),
    GetPage(
      name: _Paths.FINISH,
      page: () => const FinishView(),
      binding: FinishBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
  ];
}
