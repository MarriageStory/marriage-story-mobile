import 'package:flutter/material.dart';
import 'package:marriage_story_mobile/constants/theme.dart';

class CardTransaction extends StatelessWidget {
  const CardTransaction({
    Key? key,
    required this.onTap,
    required this.label,
    required this.date,
    required this.amount,
  }) : super(key: key);
  final String label;
  final String date;
  final String amount;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: colorPrimary, //                   <--- border color
            width: 1,
          ),
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: fontNunito.copyWith(
                        color: colorGrey,
                        fontWeight: medium,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      label,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: fontNunito.copyWith(
                        color: colorBlack,
                        fontWeight: medium,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Text(
                  amount,
                  overflow: TextOverflow.ellipsis,
                  style: fontNunito.copyWith(
                    color: colorPrimary,
                    fontWeight: medium,
                    fontSize: 16,
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
