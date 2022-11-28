import 'package:flutter/material.dart';

import '../constants/theme.dart';

class EventPack extends StatelessWidget {
  const EventPack({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: colorPrimary,
        ),
      ),
      child: Center(
        child: FittedBox(
          fit: BoxFit.none,
          child: Text(
            label,
            style: fontNunito.copyWith(
              color: colorPrimary,
              fontWeight: semiBold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
