import 'package:flutter/material.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import 'package:marriage_story_mobile/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import '../home.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final HomeController controller = Get.find();

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hai,",
                        style: fontNunito.copyWith(
                          color: colorBlack,
                          fontWeight: medium,
                          fontSize: 14,
                        ),
                      ),
                      Obx(() => Text(
                            controller.user.value.name ?? "-",
                            style: fontNunito.copyWith(
                              color: colorPink3,
                              fontWeight: bold,
                              fontSize: 20,
                            ),
                          )),
                    ],
                  ),
                  Image.asset(
                    "assets/images/user-profile.png",
                    height: 50,
                  ),
                ],
              ),
              SizedBox(
                height: 7.h,
              ),
              Container(
                height: 15.h,
                width: 100.w,
                padding: const EdgeInsets.all(defaultPadding2),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [colorPink2, colorPink3],
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      offset: const Offset(1, 1),
                      color: colorGrey.withOpacity(0.25),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Kamu,",
                      style: fontNunito.copyWith(
                        color: colorWhite,
                        fontWeight: semiBold,
                        fontSize: 14,
                      ),
                    ),
                    Obx(() => Text(
                          controller.user.value.roleName,
                          style: fontNunito.copyWith(
                            color: colorWhite,
                            fontWeight: bold,
                            fontSize: 18,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(
                () => controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : controller.user.value.roleName == "WeddingOrganize"
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 12.h,
                                width: 43.w,
                                padding: const EdgeInsets.all(defaultPadding),
                                decoration: BoxDecoration(
                                  color: colorWhite,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 6,
                                      offset: const Offset(1, 1),
                                      color: colorGrey.withOpacity(0.25),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(
                                      defaultBorderRadius),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Acara",
                                      style: fontNunito.copyWith(
                                        color: colorBlack,
                                        fontWeight: medium,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      "3",
                                      style: fontNunito.copyWith(
                                        color: colorPink3,
                                        fontWeight: extraBold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 12.h,
                                width: 43.w,
                                padding: const EdgeInsets.all(defaultPadding),
                                decoration: BoxDecoration(
                                  color: colorWhite,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 6,
                                      offset: const Offset(1, 1),
                                      color: colorGrey.withOpacity(0.25),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(
                                      defaultBorderRadius),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Agenda",
                                      style: fontNunito.copyWith(
                                        color: colorBlack,
                                        fontWeight: medium,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      "10",
                                      style: fontNunito.copyWith(
                                        color: colorPink3,
                                        fontWeight: extraBold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        : SizedBox(),
              ),
              SizedBox(
                height: 3.h,
              ),
              Obx(
                () {
                  return controller.user.value.roleName == "WeddingOrganize"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Semua Acara",
                              style: fontNunito.copyWith(
                                color: colorGrey,
                                fontWeight: semiBold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            GestureDetector(
                              onTap: () => Get.toNamed(
                                  RouteName.detailEventWeddingOrganizer),
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      defaultBorderRadius),
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
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/poster-1.png",
                                        height: 12.h,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 3,
                                                      horizontal: 6),
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
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
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 3,
                                                    horizontal: 6,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
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
                                ),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Acara",
                              style: fontNunito.copyWith(
                                color: colorGrey,
                                fontWeight: semiBold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            GestureDetector(
                              onTap: () =>
                                  Get.toNamed(RouteName.detailEventClient),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      defaultBorderRadius),
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
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/poster-1.png",
                                        height: 12.h,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 3,
                                                      horizontal: 6),
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
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
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 3,
                                                    horizontal: 6,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
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
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              "Agenda Selanjutnya",
                              style: fontNunito.copyWith(
                                color: colorGrey,
                                fontWeight: semiBold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            GestureDetector(
                              onTap: () =>
                                  Get.toNamed(RouteName.detailTaskClient),
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      defaultBorderRadius),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Kegiatan hari ini",
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
                                        ],
                                      ),
                                      Text(
                                        "20:00",
                                        style: fontNunito.copyWith(
                                          color: colorPink2,
                                          fontWeight: extraBold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
