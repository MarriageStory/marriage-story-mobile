import 'package:flutter/material.dart';
import 'package:marriage_story_mobile/routes/app_pages.dart';
import 'package:marriage_story_mobile/widgets/card_task.dart';
import 'package:marriage_story_mobile/widgets/card_payment.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/theme.dart';
import '../../../widgets/button.dart';
import '../../../widgets/card_event.dart';
import '../../home/home.dart';
import '../payment.dart';
import 'package:get/get.dart';

class PaymentView extends StatelessWidget {
  PaymentView({super.key});
  final controller = Get.find<PaymentController>();
  final controllerHome = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controllerHome.user.value.roleName == "Client"
            ? SizedBox()
            : SingleChildScrollView(
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
                                Text(
                                  "Pembayaran",
                                  style: fontNunito.copyWith(
                                    color: colorWhite,
                                    fontWeight: bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Center(
                              child: Text(
                                "Jumlah Pembayaran :",
                                style: fontNunito.copyWith(
                                  color: colorWhite,
                                  fontWeight: semiBold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Center(
                              child: Text(
                                "3",
                                style: fontNunito.copyWith(
                                  color: colorWhite,
                                  fontWeight: bold,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100.w,
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
                          top: 5.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Semua Pembayaran",
                              style: fontNunito.copyWith(
                                color: colorBlack,
                                fontWeight: semiBold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            CardPayment(
                              onTap: () => Get.toNamed(RouteName.detailPayment),
                              label: "Pernikahan Semuanya",
                              date: "23 April ",
                              eventPack: "Pack",
                              amount: "Rp 30.000.000",
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
