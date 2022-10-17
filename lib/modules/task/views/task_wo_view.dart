import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import 'package:marriage_story_mobile/widgets/button.dart';
import 'package:marriage_story_mobile/widgets/card_list_task.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../task.dart';

class TaskWeddingOrganizerView extends StatelessWidget {
  TaskWeddingOrganizerView({Key? key}) : super(key: key);
  final TaskWeddingOrganizerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 51.h,
            width: 100.w,
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      size: 30,
                      color: colorWhite,
                    ),
                    onPressed: () {},
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Semua",
                          style: fontNunito.copyWith(
                            color: colorWhite,
                            fontWeight: bold,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          "Agenda",
                          style: fontNunito.copyWith(
                            color: colorWhite,
                            fontWeight: bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
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
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "3",
                              style: fontNunito.copyWith(
                                color: colorPink3,
                                fontWeight: extraBold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Jumlah Agenda",
                              style: fontNunito.copyWith(
                                color: colorBlack,
                                fontWeight: medium,
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
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "10",
                              style: fontNunito.copyWith(
                                color: colorPink3,
                                fontWeight: extraBold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Agenda Selesai",
                              style: fontNunito.copyWith(
                                color: colorBlack,
                                fontWeight: medium,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Button(
                    height: 6.h,
                    width: 100.w,
                    onTap: () {},
                    colorBg: colorPink1,
                    label: "Tambah Agenda",
                    textColor: colorWhite,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 49.h,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10),
                children: [
                  CardListTask(
                    onTap: () {},
                    label: "Kegiatan Hari",
                    date: "23 April 2022",
                    time: "20:00",
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
