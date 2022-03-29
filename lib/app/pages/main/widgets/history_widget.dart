import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/app/pages/main/view_model/history_model.dart';
import 'package:my_app/app/styles/app_font_weight.dart';
import 'package:my_app/app/styles/app_theme.dart';

class HistoryWidget extends StatelessWidget {
  final List<HistoryModel> historyList;

  const HistoryWidget({required this.historyList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: ListView.separated(
          itemCount: historyList.length,
          padding: const EdgeInsets.all(10),
          separatorBuilder: (context, index) => Divider(
            height: 1,
            color: AppColorScheme.border,
          ),
          itemBuilder: (context, index) => ListTile(
            title: Text(
              'Vaga ${historyList[index].slotNumber} - ${historyList[index].event} as ${historyList[index].time}',
              style: TextStyle(
                color: historyList[index].color,
                fontWeight: AppFontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Carro: ${historyList[index].carType}  |  Placa: ${historyList[index].carPlate}',
            ),
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<HistoryModel>('historyList', historyList));
  }
}
