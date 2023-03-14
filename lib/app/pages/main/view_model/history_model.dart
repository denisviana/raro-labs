import 'dart:ui';

import 'package:equatable/equatable.dart';

class HistoryModel extends Equatable {
  final String time;
  final String slotNumber;
  final String event;
  final String carType;
  final String carPlate;
  final String paidValue;
  final Color color;

  const HistoryModel(
      {required this.time,
      required this.event,
      required this.slotNumber,
      required this.carPlate,
      required this.carType,
      required this.paidValue,
      required this.color});

  @override
  List<Object?> get props => [time, slotNumber, event, carType, carPlate, paidValue, color];
}
