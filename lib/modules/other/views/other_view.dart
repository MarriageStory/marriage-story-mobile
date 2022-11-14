import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import 'package:marriage_story_mobile/routes/routes.dart';
import 'package:marriage_story_mobile/utils/storage.dart';
import '../other.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OtherView extends StatelessWidget {
  OtherView({Key? key}) : super(key: key);
  final OtherController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: colorWhite,
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
                Text(
                  "Lainnya",
                  style: fontNunito.copyWith(
                    color: colorBlack,
                    fontWeight: bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/user-profile.png",
                        width: 100,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        "",
                        // controller.homeController.user.value.name,
                        style: fontNunito.copyWith(
                          color: colorBlack,
                          fontWeight: bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "",
                        // controller.homeController.user.value.roleName,
                        style: fontNunito.copyWith(
                          color: colorGrey.withOpacity(0.5),
                          fontWeight: semiBold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        width: 25.w,
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
                          onPressed: () async {
                            await Storage.removeValue('token').then(
                                (value) => Get.offAllNamed(RouteName.landing));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(defaultBorderRadius),
                            ),
                          ),
                          child: Text(
                            "Keluar",
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
