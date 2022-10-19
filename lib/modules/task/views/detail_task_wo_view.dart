import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import 'package:marriage_story_mobile/widgets/checkbox.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../task.dart';

class DetailTaskWeddingOrganizerView extends StatelessWidget {
  DetailTaskWeddingOrganizerView({Key? key}) : super(key: key);
  final TaskWeddingOrganizerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
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
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                          size: 25,
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: defaultPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Detail",
                          style: fontNunito.copyWith(
                            color: colorBlack,
                            fontWeight: bold,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          "Agenda",
                          style: fontNunito.copyWith(
                            color: colorBlack,
                            fontWeight: bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Obx(() => Checkbox(
                  value: isChecked.value,
                  onChanged: (checked)[isChecked.value = checked ?? false],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 18.h,
                  width: 75.w,
                  padding: const EdgeInsets.all(defaultPadding2),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [colorPink2, colorPink3],
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        offset: const Offset(0, 0),
                        color: colorGrey.withOpacity(0.25),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(defaultBorderRadius),
                        bottomLeft: Radius.circular(defaultBorderRadius)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "20:00",
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
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            "Senin, 23 Agustus 2022",
                            style: TextStyle(
                              color: colorWhite,
                              fontSize: 14,
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
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nama Tugas :",
                        style: fontNunito.copyWith(
                          color: colorGrey,
                          fontWeight: medium,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Melakukan Meeting dengan Pengantin",
                        style: fontNunito.copyWith(
                          color: colorBlack,
                          fontWeight: extraBold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tempat :",
                        style: fontNunito.copyWith(
                          color: colorGrey,
                          fontWeight: medium,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Jln. Sukolilo",
                        style: fontNunito.copyWith(
                          color: colorBlack,
                          fontWeight: extraBold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Detail tugas :",
                        style: fontNunito.copyWith(
                          color: colorGrey,
                          fontWeight: medium,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Detail dari tugas",
                        style: fontNunito.copyWith(
                          color: colorBlack,
                          fontWeight: extraBold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
