import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/pages/main/widgets/car_slots_widget.dart';
import 'package:my_app/app/pages/main/widgets/history_widget.dart';
import 'package:my_app/app/styles/app_color_scheme.dart';

import '../../../generated/l10n.dart';
import 'main_controller.dart';

class MainPage extends GetView<MainController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            S.of(context).meuEstacionamento,
            style: TextStyle(color: AppColorScheme.emphasis),
          ),
          bottom: TabBar(
            controller: controller.tabController,
            indicatorColor: AppColorScheme.emphasis,
            tabs: [
              Tab(
                text: S.of(context).vagas,
              ),
              Tab(
                text: S.of(context).historico,
              )
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: TabBarView(
            controller: controller.tabController,
            children: [
              Obx(
                () => CarSlotsWidget(
                  slots: controller.state.value.data?.slots ?? [],
                ),
              ),
              Obx(
                () => HistoryWidget(
                  historyList: controller.state.value.data?.historyList ?? [],
                ),
              )
            ],
          ),
        ),
      );
}
