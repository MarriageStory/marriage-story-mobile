import 'package:flutter/material.dart';
import 'package:marriage_story_mobile/constants/theme.dart';

class CardListTask extends StatelessWidget {
  const CardListTask(
      {Key? key,
      required this.onTap,
      required this.label,
      required this.date,
      required this.time,
      })
      : super(key: key);
  final String label;
  final String date;
  final String time;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          color: colorWhite,
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              color: colorGrey.withOpacity(0.25),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: fontNunito.copyWith(
                      color: colorBlack,
                      fontWeight: bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    date,
                    style: fontNunito.copyWith(
                      color: colorGrey,
                      fontWeight: medium,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Text(
                time,
                style: fontNunito.copyWith(
                  color: colorPink3,
                  fontWeight: extraBold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
