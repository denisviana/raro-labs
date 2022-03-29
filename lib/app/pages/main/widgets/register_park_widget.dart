import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_app/app/styles/app_color_scheme.dart';

class RegisterParkWidget extends StatelessWidget {
  final VoidCallback onConfirm;
  final ValueChanged<String> onChangeCarPlate;
  final ValueChanged<String> onChangeCarType;

  const RegisterParkWidget({
    required this.onChangeCarPlate,
    required this.onChangeCarType,
    required this.onConfirm,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: AppColorScheme.white,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: onChangeCarPlate,
              keyboardType: TextInputType.text,
              cursorColor: AppColorScheme.emphasis,
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                hintText: 'Placa do Carro',
                focusColor: AppColorScheme.emphasis,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColorScheme.emphasis),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: onChangeCarType,
              keyboardType: TextInputType.text,
              cursorColor: AppColorScheme.emphasis,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                hintText: 'Marca do Carro',
                focusColor: AppColorScheme.emphasis,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColorScheme.emphasis),
                ),
              ),
            ),
          ],
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<VoidCallback>.has('onConfirm', onConfirm));
    properties
        .add(ObjectFlagProperty<ValueChanged<String>>.has('onChangeCarPlate', onChangeCarPlate));
    properties
        .add(ObjectFlagProperty<ValueChanged<String>>.has('onChangeCarType', onChangeCarType));
  }
}
