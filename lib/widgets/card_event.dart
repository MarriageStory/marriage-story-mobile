import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/theme.dart';

class CardEvent extends StatelessWidget {
  const CardEvent(
      {super.key,
      required this.label,
      required this.date,
      required this.allTask,
      this.onTap,
      required this.eventPack});

  final String label;
  final String eventPack;
  final String date;
  final String allTask;
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                          allTask,
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
              SizedBox(
                height: 1.h,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: colorPrimary,
                  ),
                ),
                child: Text(
                  eventPack,
                  style: fontNunito.copyWith(
                    color: colorPrimary,
                    fontWeight: semiBold,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
