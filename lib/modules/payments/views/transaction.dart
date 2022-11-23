import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marriage_story_mobile/models/payment_model.dart';
import 'package:marriage_story_mobile/widgets/button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/theme.dart';
import '../../../widgets/button_outlined.dart';
import '../payment.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/utils/formatAngka.dart';

class TransactionView extends StatelessWidget {
  TransactionView({super.key});
  final controller = Get.find<PaymentController>();
  final PaymentDataModel payments = Get.arguments;

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
                    "Detail Transaksi",
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
              SizedBox(
                height: 3.h,
              ),
              Text(
                "Total Transaksi :",
                style: fontNunito.copyWith(
                  color: colorGrey,
                  fontWeight: medium,
                  fontSize: 14,
                ),
              ),
              Text(
                formatAngka.convertToIdr(
                    int.parse(payments.total.toString()), 2),
                style: fontNunito.copyWith(
                  color: colorBlack,
                  fontWeight: bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                "Tanggal Transaksi :",
                style: fontNunito.copyWith(
                  color: colorBlack,
                  fontWeight: semiBold,
                  fontSize: 14,
                ),
              ),
              Text(
                DateFormat('dd-MMM-yyyy').format(payments.datetime),
                style: fontNunito.copyWith(
                  color: colorBlack,
                  fontWeight: bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                "Jam :",
                style: fontNunito.copyWith(
                  color: colorBlack,
                  fontWeight: semiBold,
                  fontSize: 14,
                ),
              ),
              Text(
                DateFormat('HH:mm').format(payments.datetime),
                style: fontNunito.copyWith(
                  color: colorBlack,
                  fontWeight: bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                    height: 6.h,
                    width: 40.w,
                    onTap: () {
                      // Get.toNamed(RouteName.addTask, arguments: task);
                      controller.formEditTransaction(payments);
                    },
                    colorBg: colorPrimary,
                    label: "Edit",
                    textColor: colorWhite,
                  ),
                  ButtonOutlined(
                    height: 6.h,
                    width: 40.w,
                    label: "Hapus",
                    textColor: colorPrimary,
                    onTap: () => Get.defaultDialog(
                      title: "Hapus Transaksi",
                      titlePadding: const EdgeInsets.only(top: 30.0),
                      textConfirm: "Hapus",
                      confirmTextColor: colorWhite,
                      buttonColor: colorPrimary,
                      onConfirm: () {
                        controller.deleteTransaction(payments);
                      },
                      textCancel: "Kembali",
                      cancelTextColor: colorPrimary,
                      radius: 15,
                      contentPadding: const EdgeInsets.all(30),
                      content: Center(
                        child: Text(
                          "Apakah Anda Ingin Menghapus Agenda Ini?",
                          style: fontNunito.copyWith(
                            color: colorGrey,
                            fontWeight: semiBold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
