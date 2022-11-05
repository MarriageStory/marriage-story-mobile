import 'package:flutter/material.dart';
import 'package:marriage_story_mobile/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/theme.dart';
import '../../../widgets/button.dart';
import '../../../widgets/card_event.dart';
import '../event.dart';
import 'package:get/get.dart';

class EventView extends StatelessWidget {
  EventView({super.key});
  final controller = Get.find<EventController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 50.h,
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
                        "Acara",
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
                      "Jumlah Acara :",
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
                      "8",
                      style: fontNunito.copyWith(
                        color: colorWhite,
                        fontWeight: bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Center(
                    child: Button(
                      height: 6.h,
                      width: 75.w,
                      onTap: () {
                        controller.createEvent();
                      },

                      colorBg: colorWhite.withOpacity(0.25),
                      label: "Tambah",
                      textColor: colorWhite,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 45.h),
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
                  Text(
                    "Acara Kosong",
                    style: fontNunito.copyWith(
                      color: colorBlack,
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CardEvent(
                    label: "Pernikahan",
                    date: "23 April 2022",
                    allTask: "3",
                    eventPack: "akad",
                    onTap: () => Get.toNamed(RouteName.detailEvent),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
