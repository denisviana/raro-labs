import 'package:my_app/core/domain/constants/event_type.dart';

class HistoryEntity {
  final int slotNumber;
  final DateTime eventTime;
  final String carType;
  final String carPlate;
  final EventType eventType;

  const HistoryEntity({
    required this.slotNumber,
    required this.eventTime,
    required this.carPlate,
    required this.carType,
    required this.eventType,
  });
}
