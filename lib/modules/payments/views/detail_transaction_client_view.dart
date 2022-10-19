import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import '../payments.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailTransactionClientView extends StatelessWidget {
  DetailTransactionClientView({Key? key}) : super(key: key);
  final PaymentClientController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            right: defaultPadding,
            left: defaultPadding,
            top: marginTop,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_rounded, size: 30),
                onPressed: () {},
              ),
              Container(
                margin: const EdgeInsets.only(left: defaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Detail",
                      style: fontNunito.copyWith(
                        color: colorBlack,
                        fontWeight: bold,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "Transaksi",
                      style: fontNunito.copyWith(
                        color: colorBlack,
                        fontWeight: bold,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              Text(
                "Bukti Transaksi",
                style: fontNunito.copyWith(
                  color: colorBlack,
                  fontSize: 14,
                  fontWeight: bold,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                height: 35.h,
                width: 100.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Image border
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(48), // Image radius
                    child: Image.asset(
                      "assets/images/payment.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tanggal transaksi:",
                    style: fontNunito.copyWith(
                      color: colorGrey,
                      fontWeight: medium,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Senin, 23 April 2022",
                    style: fontNunito.copyWith(
                      color: colorBlack,
                      fontWeight: extraBold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jumlah Transaksi",
                    style: fontNunito.copyWith(
                      color: colorGrey,
                      fontWeight: medium,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Rp 10.000.000",
                    style: fontNunito.copyWith(
                      color: colorBlack,
                      fontWeight: extraBold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
