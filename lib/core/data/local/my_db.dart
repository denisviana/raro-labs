import 'package:my_app/core/domain/entity/history/history_entity.dart';

import '../../domain/entity/slot/slot_entity.dart';

abstract class MyDb {
  Future<List<SlotEntity>> setSlotAsNotAvailable({required SlotEntity slotEntity});

  Future<List<SlotEntity>> setSlotAsAvailable({
    required int slotNumber,
  });

  Future<List<HistoryEntity>> get history;

  Future<List<SlotEntity>> get slots;
}
