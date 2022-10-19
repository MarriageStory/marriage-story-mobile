import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import '../payments.dart';

class PaymentWeddingOrganizerView extends StatelessWidget {
  PaymentWeddingOrganizerView({Key? key}) : super(key: key);
  final PaymentWeddingOrganizerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 38.h,
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
                  Text(
                    "Pembayaran",
                    style: fontNunito.copyWith(
                      color: colorWhite,
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "3",
                            style: TextStyle(
                              color: colorWhite,
                              fontSize: 30,
                              fontWeight: extraBold,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: const Offset(0, 0),
                                  blurRadius: 3,
                                  color: colorGrey.withOpacity(0.5),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            "Total Pembayaran",
                            style: TextStyle(
                              color: colorWhite,
                              fontSize: 16,
                              fontWeight: semiBold,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 3,
                                  color: colorGrey.withOpacity(0.5),
                                )
                              ],
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
            height: 54.h,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10),
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(defaultBorderRadius),
                      color: colorWhite,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          offset: const Offset(1, 1),
                          color: colorGrey.withOpacity(0.25),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/poster-1.png",
                                height: 12.h,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pernikahan ",
                                    style: fontNunito.copyWith(
                                      color: colorBlack,
                                      fontWeight: bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "23 Agustus 2022",
                                    style: fontNunito.copyWith(
                                      color: colorGrey,
                                      fontWeight: medium,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  SizedBox(
                                    width: 50.w,
                                    child: Wrap(
                                      spacing: 5.0,
                                      runSpacing: 5.0,
                                      direction: Axis.horizontal,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 6),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                              color: colorPink2,
                                            ),
                                          ),
                                          child: Text(
                                            "Pre-wedding",
                                            style: fontNunito.copyWith(
                                              color: colorPink2,
                                              fontWeight: semiBold,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 3,
                                            horizontal: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                              color: colorPink2,
                                            ),
                                          ),
                                          child: Text(
                                            "Engagement",
                                            style: fontNunito.copyWith(
                                              color: colorPink2,
                                              fontWeight: semiBold,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            width: 100.w,
                            height: 5.h,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [colorPink2, colorPink3],
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ElevatedButton(
                              onPressed: () =>
                                  Get.toNamed(RouteName.detailPaymentWo),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: Text(
                                "Rp 30.000.000",
                                style: fontNunito.copyWith(
                                  color: colorWhite,
                                  fontSize: 16,
                                  fontWeight: extraBold,
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
            ),
          ),
        ],
      ),
    );
  }
}
