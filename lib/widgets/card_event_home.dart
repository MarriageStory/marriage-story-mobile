import 'package:flutter/material.dart';

import '../constants/theme.dart';

class CardEventHome extends StatelessWidget {
  const CardEventHome(
      {super.key,
      required this.label,
      required this.date,
      required this.task,
      this.onTap});

  final String label;
  final String date;
  final String task;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colorPrimary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: fontNunito.copyWith(
                        color: colorPrimary,
                        fontWeight: semiBold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      date,
                      overflow: TextOverflow.ellipsis,
                      style: fontNunito.copyWith(
                        color: colorPrimary,
                        fontWeight: medium,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: colorPrimary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      task,
                      overflow: TextOverflow.ellipsis,
                      style: fontNunito.copyWith(
                        color: colorWhite,
                        fontWeight: bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
