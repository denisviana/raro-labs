import 'package:equatable/equatable.dart';

class SlotEntity extends Equatable {
  final int slotNumber;
  final bool available;
  final DateTime? entryTime;
  final String? carPlate;
  final String? carType;
  final String? status;

  const SlotEntity({
    required this.slotNumber,
    required this.available,
    this.status,
    this.carType,
    this.carPlate,
    this.entryTime,
  });

  @override
  List<Object?> get props => [
        slotNumber,
        available,
        entryTime,
        carPlate,
        carType,
        status,
      ];
}
