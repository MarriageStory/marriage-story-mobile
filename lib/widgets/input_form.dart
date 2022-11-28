import 'package:flutter/material.dart';
import 'package:marriage_story_mobile/constants/theme.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    super.key,
    required this.label,
    required this.inputController,
  });

  final String label;
  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: colorPrimary,
          fontSize: 16,
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
