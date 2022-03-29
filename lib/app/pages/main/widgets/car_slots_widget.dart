import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/app/pages/main/main_controller.dart';
import 'package:my_app/app/pages/main/view_model/slot_model.dart';
import 'package:my_app/app/pages/main/widgets/park_icon_widget.dart';

import '../../../styles/app_color_scheme.dart';
import 'slot_widget.dart';

class CarSlotsWidget extends GetView<MainController> {
  final List<SlotModel> slots;

  const CarSlotsWidget({
    required this.slots,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: slots.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 16 / 12),
          itemBuilder: (context, index) => Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: AppColorScheme.white,
            child: InkWell(
              onTap: slots[index].available
                  ? controller.setSlotAsNotAvailable
                  : controller.setSlotAsAvailable,
              splashColor: AppColorScheme.emphasisLight.withOpacity(0.1),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: slots[index].available
                    ? ParkIconWidget(
                        slotNumber: '${slots[index].slotNumber}',
                      )
                    : SlotWidget(
                        slot: slots[index],
                      ),
              ),
            ),
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<SlotModel>('slots', slots));
  }
}
