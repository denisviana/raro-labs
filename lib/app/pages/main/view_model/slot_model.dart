import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SlotModel extends Equatable{
  final int slotNumber;
  final bool available;
  final String? entryTime;
  final String? carPlate;
  final String? status;
  final Color? backgroundColor;
  final Widget? icon;

  const SlotModel(
      {required this.slotNumber,
      required this.available,
      this.icon,
      this.status,
      this.carPlate,
      this.entryTime,
      this.backgroundColor});

  @override
  List<Object?> get props => [
    slotNumber,
    available,
    entryTime,
    carPlate,
    status,
    backgroundColor,
    icon
  ];
}
