import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import 'package:marriage_story_mobile/models/event_model.dart';
import 'package:marriage_story_mobile/models/payment_model.dart';

class CardTransaction extends StatelessWidget {
  CardTransaction({
    Key? key,
    required this.onTap,
    required this.data,
    required this.cek,
  }) : super(key: key);

  final data;
  final Function()? onTap;
  final cek;

  @override
  Widget build(BuildContext context) {
    PaymentDataModel? view;
    PaymentDetail? viewDetail;
    if (cek == true) {
      view = data;
    } else {
      viewDetail = data;
    }

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
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cek == true ? view!.namaPayment : viewDetail!.namaPayment,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: fontNunito.copyWith(
                        color: colorBlack,
                        fontWeight: medium,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      cek == true
                          ? view!.datetime.toString()
                          : viewDetail!.datetime.toString(),
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: fontNunito.copyWith(
                        color: colorGrey,
                        fontWeight: medium,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  cek == true
                      ? view!.total.toString()
                      : viewDetail!.total.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: fontNunito.copyWith(
                    color: colorPrimary,
                    fontWeight: bold,
                    fontSize: 14,
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
