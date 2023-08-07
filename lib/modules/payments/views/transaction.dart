import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marriage_story_mobile/models/payment_model.dart';
import 'package:marriage_story_mobile/widgets/button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/theme.dart';
import '../../../models/event_model.dart';
import '../../../widgets/button_outlined.dart';
import '../../home/controllers/home_controller.dart';
import '../payment.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/utils/format_angka.dart';

class TransactionView extends StatelessWidget {
  TransactionView({super.key});
  final controller = Get.find<PaymentController>();
  final HomeController homeController = Get.find();
  final data = Get.arguments;
  PaymentDataModel? payments;
  PaymentDetail? paymentsView;

  @override
  Widget build(BuildContext context) {
    if (homeController.user.value.roleId == 1) {
      payments = data;
    } else {
      paymentsView = data;
    }
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
              // Text(
              //   "Bukti Transaksi",
              //   style: fontNunito.copyWith(
              //     color: colorBlack,
              //     fontWeight: semiBold,
              //     fontSize: 14,
              //   ),
              // ),
              // SizedBox(
              //   height: 3.h,
              // ),
              Text(
                "Total Transaksi :",
                style: fontNunito.copyWith(
                  color: colorGrey,
                  fontWeight: medium,
                  fontSize: 16,
                ),
              ),
              Text(
                payments != null
                    ? FormatAngka.convertToIdr(
                        int.parse(payments!.total.toString()), 2)
                    : FormatAngka.convertToIdr(
                        int.parse(paymentsView!.total.toString()), 2),
                style: fontNunito.copyWith(
                  color: colorBlack,
                  fontWeight: bold,
                  fontSize: 18,
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
                  fontSize: 16,
                ),
              ),
              Text(
                payments != null
                    ? DateFormat('EEEE, dd MMMM yyyy')
                        .format(payments!.datetime)
                    : DateFormat('EEEE, dd MMMM yyyy')
                        .format(paymentsView!.datetime),
                style: fontNunito.copyWith(
                  color: colorBlack,
                  fontWeight: bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                "Jam Transaksi :",
                style: fontNunito.copyWith(
                  color: colorBlack,
                  fontWeight: semiBold,
                  fontSize: 16,
                ),
              ),
              Text(
                payments != null
                    ? DateFormat('HH:mm').format(payments!.datetime)
                    : DateFormat('HH:mm').format(paymentsView!.datetime),
                style: fontNunito.copyWith(
                  color: colorBlack,
                  fontWeight: bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              homeController.user.value.roleId == 1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonOutlined(
                          height: 6.h,
                          width: 43.w,
                          onTap: () {
                            // Get.toNamed(RouteName.addTask, arguments: task);
                            controller.formEditTransaction(payments!);
                          },
                          label: "Edit",
                          textColor: colorPrimary,
                        ),
                        Button(
                          height: 6.h,
                          width: 43.w,
                          colorBg: colorPrimary,
                          label: "Hapus",
                          textColor: colorWhite,
                          onTap: () => Get.defaultDialog(
                            title: "Hapus Transaksi",
                            titlePadding: const EdgeInsets.only(top: 30.0),
                            textConfirm: "Hapus",
                            confirmTextColor: colorWhite,
                            buttonColor: colorPrimary,
                            onConfirm: () {
                              controller.deleteTransaction(payments!);
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
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
