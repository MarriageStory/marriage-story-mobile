import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import 'package:marriage_story_mobile/routes/app_pages.dart';
import 'package:marriage_story_mobile/widgets/background_welcome.dart';
import 'package:marriage_story_mobile/widgets/button.dart';
import 'package:marriage_story_mobile/widgets/button_outlined.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/landing_controller.dart';
import 'package:marriage_story_mobile/routes/routes.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({Key? key}) : super(key: key);
  final controller = Get.find<LandingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            right: defaultPadding,
            left: defaultPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Apakah anda ",
                style: fontNunito.copyWith(
                  color: colorBlack,
                  fontWeight: semiBold,
                  fontSize: 20,
                ),
              ),
              Text(
                "Sudah Mempunyai akun? ",
                style: fontNunito.copyWith(
                  color: colorBlack,
                  fontWeight: semiBold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Center(
                child: Image.asset(
                  "assets/images/landing.png",
                  height: 70.w,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              ButtonOutlined(
                height: 6.h,
                width: 100.w,
                onTap: () => Get.toNamed(RouteName.login),
                label: "Masuk",
                textColor: colorPrimary,
              ),
              SizedBox(
                height: 1.h,
              ),
              Button(
                height: 6.h,
                width: 100.w,
                onTap: () => Get.toNamed(RouteName.register),
                colorBg: colorPrimary,
                label: "Daftar",
                textColor: colorWhite,
              )
            ],
          ),
        ),
      ),
    );
  }
}
