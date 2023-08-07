import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/theme.dart';
import '../../../widgets/button.dart';
import '../../../widgets/input_form.dart';
import '../../../widgets/number_form.dart';
import '../payment.dart';
import '../../../utils/date_time.dart';

class AddTransactionView extends StatelessWidget {
  AddTransactionView({super.key});
  final controller = Get.find<PaymentController>();
  final args = Get.arguments;

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
                    onPressed: () {
                      controller.clearInput();
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: colorBlack,
                    ),
                  ),
                  Text(
                    args == false ? "Edit Transaksi" : "Upload Transaksi",
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
                "Kelengkapan Transaksi",
                style: fontNunito.copyWith(
                  color: colorBlack,
                  fontWeight: semiBold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              InputForm(
                label: "Nama Pembayaran",
                inputController: controller.namaPaymentTextController,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              NumberForm(
                label: "Total Pembayaran",
                inputController: controller.totalPaymentTextController,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Obx(() => DateTime(
                    // labelText: "Date",
                    valueText:
                        controller.isChekTime.value == true || args == false
                            ? DateFormat('dd MMMM yyyy - HH:mm')
                                .format(controller.tanggal)
                            : "Tanggal Acara",
                    valueStyle: TextStyle(
                      color:
                          controller.isChekTime.value == true || args == false
                              ? colorBlack
                              : colorPrimary,
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                    onPressed: () {
                      controller.dateTimePicker(context);
                    },
                  )),
              SizedBox(
                height: 1.5.h,
              ),
              InputForm(
                label: "Detail Pembayaran",
                inputController: controller.detailPaymentTextController,
              ),
              SizedBox(
                height: 25.h,
              ),
              Button(
                height: 6.h,
                width: 100.w,
                onTap: () {
                  if (args == false) {
                    controller.updateTransaction();
                  } else {
                    controller.createTransaction();
                  }
                },
                colorBg: colorPrimary,
                label: args == false ? "Simpan" : "Tambah",
                textColor: colorWhite,
              )
            ],
          ),
        ),
      ),
    );
  }
}
