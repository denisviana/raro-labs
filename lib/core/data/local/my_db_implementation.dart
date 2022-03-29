import 'package:injectable/injectable.dart';
import 'package:my_app/core/domain/entity/history/history_entity.dart';
import 'package:my_app/core/domain/entity/slot/slot_entity.dart';

import '../../domain/constants/event_type.dart';
import 'my_db.dart';

class MyDbImplementation extends MyDb {
  late final List<SlotEntity> _slots;
  late final List<HistoryEntity> _history;

  MyDbImplementation() {
    _history = [
      HistoryEntity(
        slotNumber: 1,
        eventTime: DateTime.now().add(const Duration(hours: -2)),
        carPlate: 'AVB-1234',
        carType: 'VW Gol',
        eventType: EventType.notAvailable,
      ),
      HistoryEntity(
        slotNumber: 1,
        eventTime: DateTime.now(),
        carPlate: 'AVB-1234',
        carType: 'VW Gol',
        eventType: EventType.available,
      )
    ];
    _slots = [
      const SlotEntity(slotNumber: 1, available: true),
      const SlotEntity(slotNumber: 2, available: true),
      const SlotEntity(slotNumber: 3, available: true),
      const SlotEntity(slotNumber: 4, available: true),
      const SlotEntity(slotNumber: 5, available: true)
    ];
  }

  @override
  Future<List<SlotEntity>> setSlotAsNotAvailable({required SlotEntity slotEntity}) {
    final newList =
        _slots.map((slot) => slot.slotNumber == slotEntity.slotNumber ? slotEntity : slot).toList();
    _slots.clear();
    _slots.addAll(newList);
    _history.add(
      HistoryEntity(
        slotNumber: slotEntity.slotNumber,
        eventTime: DateTime.now(),
        carPlate: slotEntity.carPlate ?? '',
        carType: slotEntity.carType ?? '',
        eventType: EventType.notAvailable,
      ),
    );
    return Future.value(_slots);
  }

  @override
  Future<List<SlotEntity>> setSlotAsAvailable({required int slotNumber}) {
    final slot = _slots.firstWhere((element) => element.slotNumber == slotNumber);
    _history.add(
      HistoryEntity(
        slotNumber: slot.slotNumber,
        eventTime: DateTime.now(),
        carPlate: slot.carPlate ?? '',
        carType: slot.carType ?? '',
        eventType: EventType.available,
      ),
    );
    final newList = _slots
        .map((slot) => slot.slotNumber == slotNumber
            ? SlotEntity(slotNumber: slotNumber, available: true)
            : slot)
        .toList();
    _slots.clear();
    _slots.addAll(newList);
    return Future.value(_slots);
  }

  @override
  Future<List<HistoryEntity>> get history async => _history;

  @override
  Future<List<SlotEntity>> get slots async => _slots;
}
