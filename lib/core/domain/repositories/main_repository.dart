import 'package:my_app/core/resource/resource.dart';

import '../entity/history/history_entity.dart';
import '../entity/slot/slot_entity.dart';

abstract class MainRepository {
  Future<Resource<List<SlotEntity>>> setSlotAsNotAvailable({required SlotEntity slotEntity});

  Future<Resource<List<SlotEntity>>> setSlotAsAvailable({
    required int slotNumber,
  });

  Future<Resource<List<HistoryEntity>>> get history;

  Future<Resource<List<SlotEntity>>> get slots;
}
