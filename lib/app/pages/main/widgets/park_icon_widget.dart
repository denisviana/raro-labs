import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../styles/app_color_scheme.dart';

class ParkIconWidget extends StatelessWidget {
  final String slotNumber;

  const ParkIconWidget({
    required this.slotNumber,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$slotNumber',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                S.of(context).disponvel,
                style: TextStyle(
                  fontSize: 15,
                  color: AppColorScheme.success,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container()
            ],
          ),
          Center(
            child: Container(
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 5,
                  color: AppColorScheme.success,
                ),
              ),
              child: Center(
                child: Text(
                  'E',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: AppColorScheme.success,
                  ),
                ),
              ),
            ),
          ),
          Container()
        ],
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('slotNumber', slotNumber));
  }
}
