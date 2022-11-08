import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:marriage_story_mobile/widgets/button.dart';
import 'package:marriage_story_mobile/widgets/button_outlined.dart';
import 'package:marriage_story_mobile/widgets/vendor_pack.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/theme.dart';
import '../../../models/event_model.dart';
import '../../../routes/routes.dart';
import '../../../widgets/event_pack.dart';
import '../event.dart';
import 'package:get/get.dart';

class DetailEventView extends StatelessWidget {
  DetailEventView({super.key});
  final controller = Get.find<EventController>();
  final EventDataModel event = Get.arguments;

  @override
  Widget build(BuildContext context) {
    // final event = ModalRoute.of(context)!.settings.arguments as EventDataModel;

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
                        event.date.toString(),
                        style: fontNunito.copyWith(
                          color: colorWhite,
                          fontWeight: semiBold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        event.nameClient,
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
                            "Kode : ${event.gencode}",
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
                        Flexible(
                          child: GestureDetector(
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
                      height: 4.h,
                      width: 70.w,
                      child: ListView(
                        semanticChildCount: 2,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(5),
                        children: [
                          EventPack(label: "label"),
                          EventPack(label: "label"),
                          EventPack(label: "label"),
                          EventPack(label: "label"),
                          EventPack(label: "label"),
                          EventPack(label: "label"),
                          EventPack(label: "label"),
                          EventPack(label: "label"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 70.w,
                      child: Wrap(
                        spacing: 5.0,
                        runSpacing: 5.0,
                        direction: Axis.horizontal,
                        children: [],
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
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonOutlined(
                          height: 6.h,
                          width: 40.w,
                          onTap: () {},
                          label: "Edit",
                          textColor: colorPrimary,
                        ),
                        Button(
                          height: 6.h,
                          width: 40.w,
                          onTap: () => controller.deleteEvent(event.id),
                          colorBg: colorPrimary,
                          label: "Hapus",
                          textColor: colorWhite,
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
