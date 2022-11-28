import 'package:flutter/material.dart';
import 'package:marriage_story_mobile/constants/theme.dart';

class DateTime extends StatelessWidget {
  final String valueText;
  final TextStyle valueStyle;
  final VoidCallback onPressed;

  const DateTime({
    Key? key,
    required this.valueText,
    required this.valueStyle,
    required this.onPressed,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: InputDecorator(
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(defaultBorderRadius)),
            borderSide: BorderSide(
              color: colorPrimary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(defaultBorderRadius)),
            borderSide: BorderSide(
              color: colorPrimary,
            ),
          ),
        ),
        baseStyle: valueStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              valueText,
              style: valueStyle,
            ),
          ],
        ),
      ),
    );
  }
}
