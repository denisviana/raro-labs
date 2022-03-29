import 'package:equatable/equatable.dart';
import 'package:my_app/app/pages/main/view_model/history_model.dart';
import 'package:my_app/app/pages/main/view_model/slot_model.dart';

class MainViewModel extends Equatable{
  final List<SlotModel> slots;
  final List<HistoryModel> historyList;

  const MainViewModel({required this.slots, required this.historyList,});

  @override
  List<Object?> get props => [slots, historyList];
}
