import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import 'package:marriage_story_mobile/routes/app_pages.dart';
import 'package:marriage_story_mobile/widgets/button.dart';
import 'package:marriage_story_mobile/widgets/button_outlined.dart';
import 'package:marriage_story_mobile/widgets/card_task.dart';
import 'package:marriage_story_mobile/widgets/detail_format.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../task.dart';

class DetailTaskView extends StatelessWidget {
  DetailTaskView({super.key});
  final controller = Get.find<TaskController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 45.h,
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
                              "Detail Agenda",
                              style: fontNunito.copyWith(
                                color: colorWhite,
                                fontWeight: bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: 4.h,
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Center(
                      child: Text(
                        "20 : 00",
                        style: fontNunito.copyWith(
                          color: colorWhite,
                          fontWeight: bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Senin, 24 April 2022",
                        style: fontNunito.copyWith(
                          color: colorWhite,
                          fontWeight: semiBold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 100.w,
              margin: EdgeInsets.only(top: 40.h),
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
                  top: 8.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DetailFormat(
                      keterangan: "Kegiatan :",
                      label: "label",
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    DetailFormat(
                      keterangan: "Tempat :",
                      label: "label",
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    DetailFormat(
                      keterangan: "Detail Kegiatan :",
                      label: "label",
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
                          onTap: () {},
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
                            title: "Hapus Agenda",
                            titlePadding: const EdgeInsets.only(top: 30.0),
                            textConfirm: "Hapus",
                            confirmTextColor: colorWhite,
                            buttonColor: colorPrimary,
                            onConfirm: () {},
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
          ],
        ),
      ),
    );
  }
}
