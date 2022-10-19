import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/routes/app_pages.dart';
import '../payments.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:marriage_story_mobile/constants/theme.dart';

class DetailPaymentWeddingOrganizerView extends StatelessWidget {
  DetailPaymentWeddingOrganizerView({Key? key}) : super(key: key);
  final PaymentWeddingOrganizerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50.h,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [colorPink2, colorPink3],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                right: defaultPadding,
                left: defaultPadding,
                top: marginTop,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          size: 25,
                          color: colorWhite,
                        ),
                        onPressed: () {},
                      ),
                      Text(
                        "Detail Pembayaran",
                        style: fontNunito.copyWith(
                          color: colorWhite,
                          fontWeight: bold,
                          fontSize: 18,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          size: 25,
                          color: Colors.transparent,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Pernikahan Aan dan Ainul",
                            style: fontNunito.copyWith(
                              color: colorWhite.withOpacity(0.7),
                              fontWeight: bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "23 Agustus 2022",
                            style: fontNunito.copyWith(
                              color: colorWhite.withOpacity(0.7),
                              fontWeight: bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Total Pembayaran",
                            style: fontNunito.copyWith(
                              color: colorWhite,
                              fontWeight: bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "Rp 30.000.000",
                            style: fontNunito.copyWith(
                              color: colorWhite,
                              fontWeight: bold,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 42.h,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10),
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(RouteName.detailTransactionWo),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius),
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
                          children: [
                            Container(
                              height: 4.h,
                              width: 4.h,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [colorPink2, colorPink3],
                                ),
                                borderRadius:
                                    BorderRadius.circular(defaultPadding3),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: colorWhite,
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              width: 40.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Kirim Uang",
                                    style: fontNunito.copyWith(
                                      color: colorBlack,
                                      fontWeight: semiBold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "25 Agustus 2022",
                                    style: fontNunito.copyWith(
                                      color: colorGrey.withOpacity(0.5),
                                      fontWeight: semiBold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "Rp 1.000.000",
                              style: fontNunito.copyWith(
                                color: colorBlack,
                                fontWeight: bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
