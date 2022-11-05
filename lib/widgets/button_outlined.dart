import 'package:flutter/material.dart';
import '../constants/theme.dart';

class ButtonOutlined extends StatelessWidget {
  const ButtonOutlined(
      {super.key,
      required this.height,
      required this.width,
      required this.onTap,
      required this.label,
      required this.textColor});

  final double height;
  final double width;
  final Function()? onTap;
  final String label;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: colorPrimary),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(defaultBorderRadius), // <-- Radius
          ),
        ),
        child: Text(
          label,
          style: fontNunito.copyWith(
            color: textColor,
            fontSize: 14,
            fontWeight: bold,
          ),
        ),
      ),
    );
  }
}
