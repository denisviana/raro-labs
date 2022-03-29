import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/pages/main/adapter/main_adapter.dart';
import 'package:my_app/app/pages/main/view_model/main_view_model.dart';
import 'package:my_app/core/domain/use_cases/main/get_history_use_case.dart';
import 'package:my_app/core/domain/use_cases/main/get_slots_use_case.dart';
import 'package:my_app/core/domain/use_cases/main/set_slot_as_available_use_case.dart';
import 'package:my_app/core/domain/use_cases/main/set_slot_as_not_available_use_case.dart';
import 'package:my_app/core/resource/resource.dart';

class MainController extends GetxController with GetSingleTickerProviderStateMixin {
  final SetSlotAsNotAvailableUseCase _setSlotAsNotAvailableUseCase;
  final SetSlotAsAvailableUseCase _setSlotAsAvailableUseCase;
  final GetHistoryUseCase _getHistoryUseCase;
  final GetSlotsUseCase _getSlotsUseCase;

  MainController(
    this._getHistoryUseCase,
    this._setSlotAsAvailableUseCase,
    this._setSlotAsNotAvailableUseCase,
    this._getSlotsUseCase,
  );

  final state = Resource.success<MainViewModel>(data: MainAdapter.init()).obs;

  //region Variables
  late final TabController tabController;

//endregion

//region Functions
  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    getData();
    super.onInit();
  }

  Future getData() async {
    final slots = await _getSlotsUseCase();
    final history = await _getHistoryUseCase();
    state.value = Resource.success(
      data: MainAdapter.toViewModel(slots.data ?? [], history.data ?? []),
    );
  }

  void setSlotAsNotAvailable() {}

  void setSlotAsAvailable() {}

//endregion

}
