import 'package:get/get.dart';
import 'package:my_app/app/pages/main/main_controller.dart';
import 'package:my_app/di/di.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController(
          getIt(),
          getIt(),
          getIt(),
          getIt(),
        ));
  }
}
