import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import 'package:marriage_story_mobile/widgets/home_client_empty.dart';
import '../controllers/home_client_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeClientView extends StatelessWidget {
  HomeClientView({Key? key}) : super(key: key);
  final controller = Get.find<HomeClientController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hai,",
                          style: fontNunito.copyWith(
                            color: colorBlack,
                            fontWeight: medium,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "user.name,",
                          style: fontNunito.copyWith(
                            color: colorPink3,
                            fontWeight: bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/images/user-profile.png",
                      height: 50,
                    )
                  ],
                ),
                SizedBox(
                  height: 7.h,
                ),
                Container(
                  height: 15.h,
                  width: 100.w,
                  padding: const EdgeInsets.all(defaultPadding2),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [colorPink2, colorPink3],
                    ),
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Kamu,",
                        style: fontNunito.copyWith(
                          color: colorWhite,
                          fontWeight: semiBold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Pengantin ",
                        style: fontNunito.copyWith(
                          color: colorWhite,
                          fontWeight: bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                const HomeClientEmpty(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
