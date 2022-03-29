import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/app/pages/main/view_model/history_model.dart';
import 'package:my_app/app/pages/main/view_model/main_view_model.dart';
import 'package:my_app/app/pages/main/view_model/slot_model.dart';
import 'package:my_app/app/styles/app_color_scheme.dart';
import 'package:my_app/core/domain/constants/event_type.dart';
import 'package:my_app/core/domain/entity/history/history_entity.dart';

import '../../../../core/domain/entity/slot/slot_entity.dart';
import '../../../../generated/l10n.dart';

abstract class MainAdapter {
  MainAdapter._();

  static MainViewModel init() => const MainViewModel(slots: [], historyList: []);

  static MainViewModel toViewModel(
      List<SlotEntity> slotEntities, List<HistoryEntity> historyEntities) {
    final slots = slotEntities
        .map((e) => SlotModel(
              slotNumber: e.slotNumber,
              entryTime:
                  e.available ? null : DateFormat('HH:mm').format(e.entryTime ?? DateTime.now()),
              carPlate: e.available ? null : e.carPlate,
              status: e.available ? S.current.disponvel : S.current.ocupada,
              icon: e.available ? null : Image.asset('images/car2.png'),
              available: e.available,
            ))
        .toList();

    historyEntities.sort((a, b) => b.eventTime.compareTo(a.eventTime));
    final history = historyEntities
        .map(
          (e) => HistoryModel(
              time: DateFormat('HH:mm').format(e.eventTime),
              event: e.eventType == EventType.available ? 'Saiu' : 'Entrou',
              slotNumber: e.slotNumber.toString(),
              carPlate: e.carPlate,
              carType: e.carType,
              paidValue: '',
              color: e.eventType == EventType.available
                  ? AppColorScheme.error
                  : AppColorScheme.success),
        )
        .toList();

    return MainViewModel(slots: slots, historyList: history);
  }
}
