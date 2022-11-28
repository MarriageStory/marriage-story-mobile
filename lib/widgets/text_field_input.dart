import 'package:flutter/material.dart';
import 'package:marriage_story_mobile/constants/theme.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: colorPink, width: 1),
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: colorPink, width: 0.5),
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
        hintText: title,
        hintStyle: fontNunito.copyWith(
          color: colorGrey,
          fontSize: 14,
          fontWeight: medium,
        ),
      ),
    );
  }
}
