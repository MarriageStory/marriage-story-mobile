import 'package:flutter/material.dart';
import '../constants/theme.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.height,
      required this.width,
      required this.onTap,
      required this.colorBg,
      required this.label,
      required this.textColor});

  final double height;
  final double width;
  final Function()? onTap;
  final Color colorBg;
  final String label;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorBg,
          shadowColor: Colors.transparent,
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
