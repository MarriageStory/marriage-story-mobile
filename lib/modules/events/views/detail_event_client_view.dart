import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import '../event.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailEventClientView extends StatelessWidget {
  DetailEventClientView({Key? key}) : super(key: key);
  final DetailEventClientController controller = Get.find();

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
              IconButton(
                icon: const Icon(Icons.arrow_back_rounded, size: 30),
                onPressed: () {},
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
                      "Acara",
                      style: fontNunito.copyWith(
                        color: colorBlack,
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
              Container(
                height: 23.h,
                width: 100.w,
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
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kode 123011239",
                      style: fontNunito.copyWith(
                        color: colorWhite,
                        fontWeight: semiBold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Pernikahan",
                              style: TextStyle(
                                color: colorWhite,
                                fontSize: 18,
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
                            Text(
                              "Afnan dan Aan",
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
                              "23 Agustus 2022",
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
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                width: 70.w,
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
                        "Akaad",
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
                        "Lainnya",
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
              SizedBox(
                height: 3.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Waktu Pelaksanaan :",
                        style: fontNunito.copyWith(
                          color: colorGrey,
                          fontWeight: medium,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "20:00",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Pembayaran :",
                            style: fontNunito.copyWith(
                              color: colorGrey,
                              fontWeight: medium,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "Rp 30.000.000",
                            style: fontNunito.copyWith(
                              color: colorBlack,
                              fontWeight: extraBold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 40.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [colorPink2, colorPink3],
                          ),
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius),
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(defaultBorderRadius),
                            ),
                          ),
                          child: Text(
                            "Lihat Pembayaran",
                            style: fontNunito.copyWith(
                              color: colorWhite,
                              fontSize: 14,
                              fontWeight: bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Catatan :",
                        style: fontNunito.copyWith(
                          color: colorGrey,
                          fontWeight: medium,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Ini adalah catatan dari WO",
                        style: fontNunito.copyWith(
                          color: colorBlack,
                          fontWeight: medium,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
