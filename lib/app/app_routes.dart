import 'package:get/get.dart';
import 'package:my_app/app/pages/main/bindings/main_binding.dart';
import 'package:my_app/app/pages/main/main_page.dart';

abstract class Routes {
  static String main = '/';
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';
  static const account = '/account';
  static const resetPassword = '/reset-password';
}

mixin AppRoutes {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.main,
      page: () => MainPage(),
      binding: MainBinding(),
    )
  ];
}
