import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EventWeddingOrganizerView extends StatelessWidget {
  const EventWeddingOrganizerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        color: colorWhite,
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
              Row(
                children: [
                  Container(
                    height: 17.h,
                    width: 60.w,
                    padding: const EdgeInsets.symmetric(
                      vertical: defaultPadding2,
                      horizontal: defaultPadding3,
                    ),
                    decoration: BoxDecoration(
                      color: colorWhite,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jumlah Acara",
                          style: TextStyle(
                            color: colorBlack,
                            fontWeight: bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          "3",
                          style: TextStyle(
                            color: colorPink3,
                            fontWeight: bold,
                            fontSize: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [colorPink2, colorPink3],
                      ),
                      borderRadius: BorderRadius.circular(defaultBorderRadius2),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius2),
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        color: colorWhite,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
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
                                    borderRadius: BorderRadius.circular(5),
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
                                    borderRadius: BorderRadius.circular(5),
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
            ],
          ),
        ),
      ),
    );
  }
}
