import 'package:get/get.dart';
import 'package:my_app/app/pages/main/main_controller.dart';
import 'package:my_app/core/data/local/my_db.dart';
import 'package:my_app/core/data/local/my_db_implementation.dart';
import 'package:my_app/core/data/repositories/main_repository_implementation.dart';
import 'package:my_app/core/domain/repositories/main_repository.dart';
import 'package:my_app/core/domain/use_cases/main/get_history_use_case.dart';
import 'package:my_app/core/domain/use_cases/main/get_slots_use_case.dart';
import 'package:my_app/core/domain/use_cases/main/set_slot_as_available_use_case.dart';
import 'package:my_app/core/domain/use_cases/main/set_slot_as_not_available_use_case.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MyDb>(MyDbImplementation());
    Get.lazyPut<MainRepository>(() => MainRepositoryImplementation(Get.find()));
    Get.create(() => SetSlotAsAvailableUseCase(Get.find()));
    Get.create(() => SetSlotAsNotAvailableUseCase(Get.find()));
    Get.create(() => GetHistoryUseCase(Get.find()));
    Get.create(() => GetSlotsUseCase(Get.find()));
    Get.lazyPut(() => MainController(
          Get.find(),
          Get.find(),
          Get.find(),
          Get.find(),
        ));
  }
}
