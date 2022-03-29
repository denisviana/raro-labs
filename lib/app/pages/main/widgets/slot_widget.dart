import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/app/pages/main/view_model/slot_model.dart';

class SlotWidget extends StatelessWidget {
  final SlotModel slot;

  const SlotWidget({required this.slot, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${slot.slotNumber}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                '${slot.status}: ${slot.entryTime}',
                style: TextStyle(
                  fontSize: 15,
                  color: slot.backgroundColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container()
            ],
          ),
          Center(
            child: slot.slotNumber.isEven
                ? Image.asset(
                    'images/car.png',
                    width: 60,
                  )
                : Image.asset(
                    'images/car2.png',
                    width: 60,
                  ),
          ),
          Text(
            'Placa: ${slot.carPlate}',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<SlotModel>('slot', slot));
  }
}
