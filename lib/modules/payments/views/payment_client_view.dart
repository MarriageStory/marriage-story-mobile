import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/routes.dart';
import '../payments.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:marriage_story_mobile/constants/theme.dart';

class PaymentClientView extends StatelessWidget {
  PaymentClientView({Key? key}) : super(key: key);
  final PaymentClientController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 45.h,
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
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Total Pembayaran :",
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
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            "Rp 3.000.000,00",
                            style: TextStyle(
                              color: colorWhite,
                              fontSize: 25,
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
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Center(
                    child: Container(
                      width: 50.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                        color: colorPink1,
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius),
                      ),
                      child: ElevatedButton(
                        onPressed: ()=> Get.toNamed(RouteName.addTransactionClient),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius),
                          ),
                        ),
                        child: Text(
                          "Upload Pembayaran",
                          style: fontNunito.copyWith(
                            color: colorWhite,
                            fontSize: 14,
                            fontWeight: bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 47.h,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10),
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(RouteName.detailTransactionClient),
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
