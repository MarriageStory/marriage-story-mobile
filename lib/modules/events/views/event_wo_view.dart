import 'package:flutter/material.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';
import '../event.dart';

class EventWeddingOrganizerView extends StatelessWidget {
  EventWeddingOrganizerView({Key? key}) : super(key: key);
  final EventWeddingOrganizerController controller = Get.find();

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Agenda",
                    style: TextStyle(
                      color: colorBlack,
                      fontWeight: bold,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    "Acara",
                    style: TextStyle(
                      color: colorBlack,
                      fontWeight: bold,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 18.h,
                  width: 63.w,
                  padding: const EdgeInsets.all(defaultPadding2),
                  decoration: BoxDecoration(
                    color: colorWhite,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        offset: const Offset(0, 0),
                        color: colorGrey.withOpacity(0.25),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(defaultBorderRadius),
                        bottomRight: Radius.circular(defaultBorderRadius)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "3",
                            style: TextStyle(
                              color: colorPink3,
                              fontSize: 35,
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
                            "Jumlah Acara",
                            style: TextStyle(
                              color: colorGrey,
                              fontSize: 14,
                              fontWeight: extraBold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                    primary: colorPink2,
                  ),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius),
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
                      ),
                    ),
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
