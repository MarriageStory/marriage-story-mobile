import 'package:flutter/material.dart';
import 'package:marriage_story_mobile/routes/app_pages.dart';
import 'package:marriage_story_mobile/widgets/card_task.dart';
import 'package:marriage_story_mobile/widgets/card_transaction.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/theme.dart';
import '../../../widgets/event_pack.dart';
import '../payment.dart';
import 'package:get/get.dart';

class DetailPaymentView extends StatelessWidget {
  DetailPaymentView({super.key});
  final controller = Get.find<PaymentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 40.h,
              decoration: BoxDecoration(gradient: colorGradient),
              child: Padding(
                padding: EdgeInsets.only(
                  right: defaultPadding,
                  left: defaultPadding,
                  top: 6.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
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
                                color: colorWhite,
                              ),
                            ),
                            Text(
                              "Agenda Acara",
                              style: fontNunito.copyWith(
                                color: colorWhite,
                                fontWeight: bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Image.asset(
                            "assets/images/payment.png",
                            width: 20.w,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Text(
                                "Total Pembayaran :",
                                style: fontNunito.copyWith(
                                  color: colorWhite,
                                  fontWeight: medium,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "Rp 30.000.000.000 ",
                                overflow: TextOverflow.ellipsis,
                                style: fontNunito.copyWith(
                                  color: colorWhite,
                                  fontWeight: bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 35.h),
              decoration: const BoxDecoration(
                color: colorWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultBorderRadius2),
                  topRight: Radius.circular(defaultBorderRadius2),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  right: defaultPadding,
                  left: defaultPadding,
                  top: 6.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Pernikahan Ainul dan Aan ",
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: fontNunito.copyWith(
                            color: colorPrimary,
                            fontWeight: semiBold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        SizedBox(
                          width: 70.w,
                          child: Wrap(
                            spacing: 5.0,
                            runSpacing: 5.0,
                            direction: Axis.horizontal,
                            children: const [
                              EventPack(label: "Pre Wedding"),
                              EventPack(label: "Akad"),
                              EventPack(label: "Akad"),
                              EventPack(label: "Akad"),
                              EventPack(label: "Akad"),
                              EventPack(label: "Akad"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: colorPrimary.withOpacity(0.3),
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(35),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Detail Transaksi ",
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: fontNunito.copyWith(
                                color: colorPrimary,
                                fontWeight: bold,
                                fontSize: 18,
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
                                    "Jumlah Transaksi :",
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
                                    "3",
                                    overflow: TextOverflow.ellipsis,
                                    style: fontNunito.copyWith(
                                      color: colorPrimary,
                                      fontWeight: bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    "Total Transaksi :",
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
                                    "Rp 30.000.000",
                                    overflow: TextOverflow.ellipsis,
                                    style: fontNunito.copyWith(
                                      color: colorPrimary,
                                      fontWeight: bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "Semua Transaksi",
                      overflow: TextOverflow.ellipsis,
                      style: fontNunito.copyWith(
                        color: colorBlack,
                        fontWeight: medium,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    CardTransaction(
                      onTap: () => Get.toNamed(RouteName.transaction),
                      date: "23 April 2022",
                      amount: "Rp 30. 000 000 000 000",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
