import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:marriage_story_mobile/widgets/button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/theme.dart';
import '../payment.dart';
import 'package:get/get.dart';

class TransactionView extends StatelessWidget {
  TransactionView({super.key});
  final controller = Get.find<PaymentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: defaultPadding,
            left: defaultPadding,
            top: 6.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: colorBlack,
                    ),
                  ),
                  Text(
                    "Tambah Acara",
                    style: fontNunito.copyWith(
                      color: colorBlack,
                      fontWeight: semiBold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 4.h,
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Bukti Transaksi",
                style: fontNunito.copyWith(
                  color: colorBlack,
                  fontWeight: semiBold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
