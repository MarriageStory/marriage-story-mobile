import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import 'package:marriage_story_mobile/routes/routes.dart';
import 'package:marriage_story_mobile/widgets/background_welcome.dart';
import '../controllers/role_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({Key? key}) : super(key: key);
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Siapakah Anda ?",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
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
                              onPressed: () => Get.toNamed(RouteName.login),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      defaultBorderRadius),
                                ),
                              ),
                              child: Text(
                                "WO",
                                style: fontNunito.copyWith(
                                  color: colorWhite,
                                  fontSize: 14,
                                  fontWeight: bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: Container(
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
                              onPressed: () => Get.toNamed(RouteName.landing),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      defaultBorderRadius),
                                ),
                              ),
                              child: Text(
                                "Pengantin",
                                style: fontNunito.copyWith(
                                  color: colorWhite,
                                  fontSize: 14,
                                  fontWeight: bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
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
