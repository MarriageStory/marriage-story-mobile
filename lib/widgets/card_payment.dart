import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/theme.dart';

class CardPayment extends StatelessWidget {
  const CardPayment(
      {super.key,
      required this.label,
      required this.date,
      this.onTap,
      required this.eventPack,
      required this.amount});

  final String label;
  final String eventPack;
  final String date;
  final String amount;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100.w,
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
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "Total Pembayaran :",
                      overflow: TextOverflow.ellipsis,
                      style: fontNunito.copyWith(
                        color: colorPrimary,
                        fontWeight: medium,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      amount,
                      overflow: TextOverflow.ellipsis,
                      style: fontNunito.copyWith(
                        color: colorPrimary,
                        fontWeight: bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
