import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:marriage_story_mobile/widgets/vendor_pack.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/theme.dart';
import '../../../routes/routes.dart';
import '../../../widgets/event_pack.dart';
import '../../home/home.dart';
import '../event.dart';
import 'package:get/get.dart';

class DetailEventView extends StatelessWidget {
  DetailEventView({super.key});
  final controller = Get.find<EventController>();

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
                              "Acara",
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
                        "23 April 2022",
                        style: fontNunito.copyWith(
                          color: colorWhite,
                          fontWeight: semiBold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Pernikahan Aan dan Ainul",
                        style: fontNunito.copyWith(
                          color: colorWhite,
                          fontWeight: semiBold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorWhite.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Kode : Hsda",
                            overflow: TextOverflow.ellipsis,
                            style: fontNunito.copyWith(
                              color: colorWhite,
                              fontWeight: bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
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
                  top: 5.h,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:
                                  colorPrimary, //                   <--- border color
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 7.w,
                              vertical: 3.h,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "10",
                                  overflow: TextOverflow.ellipsis,
                                  style: fontNunito.copyWith(
                                    color: colorBlack,
                                    fontWeight: bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "Jumlah Agenda",
                                  overflow: TextOverflow.ellipsis,
                                  style: fontNunito.copyWith(
                                    color: colorGrey,
                                    fontWeight: semiBold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed(RouteName.task),
                          child: Text(
                            "Lihat Agenda",
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
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "Paket Acara",
                      overflow: TextOverflow.ellipsis,
                      style: fontNunito.copyWith(
                        color: colorBlack,
                        fontWeight: medium,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: 70.w,
                      child: Wrap(
                        spacing: 5.0,
                        runSpacing: 5.0,
                        direction: Axis.horizontal,
                        children: const [
                          EventPack(label: "Pre Wedding"),
                          EventPack(label: "Engagment"),
                          EventPack(label: "Resepsi"),
                          EventPack(label: "Panggih"),
                          EventPack(label: "Akad"),
                          EventPack(label: "Akad"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "Vendor",
                      overflow: TextOverflow.ellipsis,
                      style: fontNunito.copyWith(
                        color: colorBlack,
                        fontWeight: medium,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  log("message");
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: colorPrimary.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Icon(
                                    Icons.add_rounded,
                                    color: colorPrimary,
                                    size: 7.w,
                                  ),
                                ),
                              ),
                              Text(
                                "Tambah",
                                overflow: TextOverflow.ellipsis,
                                style: fontNunito.copyWith(
                                  color: colorBlack,
                                  fontWeight: regular,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 11.h,
                          width: 70.w,
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(5),
                            children: [
                              VendorPack(
                                label: "label",
                                onTap: (() {}),
                              ),
                            ],
                          ),
                        ),
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
