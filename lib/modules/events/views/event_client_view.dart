import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import 'package:marriage_story_mobile/widgets/card_list_task.dart';
import '../controllers/event_client_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:marriage_story_mobile/routes/routes.dart';

class EventClientView extends StatelessWidget {
  EventClientView({Key? key}) : super(key: key);
  final controller = Get.find<EventClientController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 55.h,
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
                    "Agenda",
                    style: fontNunito.copyWith(
                      color: colorWhite,
                      fontWeight: bold,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    "Acara",
                    style: fontNunito.copyWith(
                      color: colorWhite,
                      fontWeight: bold,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  SizedBox(
                    width: 50.w,
                    height: 5.h,
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
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: colorWhite,
                            ),
                          ),
                          child: Text(
                            "Pre-wedding",
                            style: fontNunito.copyWith(
                              color: colorWhite,
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
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: colorWhite,
                            ),
                          ),
                          child: Text(
                            "Engagement",
                            style: fontNunito.copyWith(
                              color: colorWhite,
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
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: colorWhite,
                            ),
                          ),
                          child: Text(
                            "Engagement",
                            style: fontNunito.copyWith(
                              color: colorWhite,
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
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: colorWhite,
                            ),
                          ),
                          child: Text(
                            "Engagement",
                            style: fontNunito.copyWith(
                              color: colorWhite,
                              fontWeight: semiBold,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 9.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Pernikahan",
                            style: TextStyle(
                              color: colorWhite,
                              fontSize: 18,
                              fontWeight: extraBold,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 3,
                                  color: colorGrey.withOpacity(0.5),
                                )
                              ],
                            ),
                          ),
                          Text(
                            "Afnan dan Aan",
                            style: TextStyle(
                              color: colorWhite,
                              fontSize: 25,
                              fontWeight: extraBold,
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
                            height: 1.h,
                          ),
                          Text(
                            "23 Agustus 2022",
                            style: TextStyle(
                              color: colorWhite,
                              fontSize: 14,
                              fontWeight: extraBold,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(0, 0),
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
                    height: 6.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Kode 12313912",
                        style: TextStyle(
                          color: colorWhite,
                          fontSize: 14,
                          fontWeight: extraBold,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0, 0),
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
          ),
          SizedBox(
            height: 37.h,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10),
                children: [
                  CardListTask(
                    onTap: () => Get.toNamed(RouteName.detailTaskClient),
                    label: "TM - 1",
                    date: "23 April 2022",
                    time: "23:00",
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
