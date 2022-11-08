import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marriage_story_mobile/constants/theme.dart';

class NumberForm extends StatelessWidget {
  const NumberForm({
    super.key,
    required this.label,
    required this.inputController,
  });

  final String label;
  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: inputController,
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: colorPrimary,
          fontSize: 14,
          fontWeight: medium,
        ),
        labelText: label,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
          borderSide: BorderSide(
            color: colorPrimary,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
          borderSide: BorderSide(
            color: colorPrimary,
          ),
        ),
      ),
    );
  }
}
