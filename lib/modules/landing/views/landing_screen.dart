import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import 'package:marriage_story_mobile/routes/app_pages.dart';
import 'package:marriage_story_mobile/widgets/background_welcome.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/landing_controller.dart';
import 'package:marriage_story_mobile/routes/routes.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({Key? key}) : super(key: key);
  final controller = Get.find<LandingController>();

  @override
  Widget build(BuildContext context) {
    return BackgroundWelcome(
      child: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 100.w,
                      height: 6.h,
                      child: OutlinedButton(
                        onPressed: () {
                          Get.toNamed(RouteName.login);
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: colorPink2),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius),
                          ),
                        ),
                        child: Text(
                          "Masuk",
                          style: fontNunito.copyWith(
                            fontSize: 14,
                            fontWeight: bold,
                            color: colorPink2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 100.w,
                      height: 6.h,
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
                        onPressed: () => Get.toNamed(RouteName.register),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius),
                          ),
                        ),
                        child: Text(
                          "Daftar",
                          style: fontNunito.copyWith(
                            color: colorWhite,
                            fontSize: 14,
                            fontWeight: bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
