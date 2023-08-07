import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import 'package:marriage_story_mobile/routes/routes.dart';
import 'package:marriage_story_mobile/utils/storage.dart';
import 'package:marriage_story_mobile/widgets/button.dart';
import 'package:marriage_story_mobile/widgets/button_outlined.dart';
import '../../events/event.dart';
import '../../home/controllers/home_controller.dart';
import '../other.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OtherView extends StatelessWidget {
  OtherView({Key? key}) : super(key: key);
  final OtherController controller = Get.find();
  final HomeController homeController = Get.find();
  final EventController eventController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 50.h,
              decoration: BoxDecoration(gradient: colorGradient),
              child: Padding(
                padding: EdgeInsets.only(
                  right: defaultPadding,
                  left: defaultPadding,
                  top: 6.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Lainnya",
                              style: fontNunito.copyWith(
                                color: colorWhite,
                                fontWeight: bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Center(
                      child: Image.asset(
                        "assets/images/user-profile.png",
                        width: 30.w,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Center(
                      child: Text(
                        homeController.user.value.fullname,
                        overflow: TextOverflow.ellipsis,
                        style: fontNunito.copyWith(
                          color: colorWhite,
                          fontWeight: bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        homeController.user.value.role.roleName,
                        style: fontNunito.copyWith(
                          color: colorWhite,
                          fontWeight: bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 45.h),
              decoration: const BoxDecoration(
                color: colorWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultBorderRadius2),
                  topRight: Radius.circular(defaultBorderRadius2),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  right: defaultPadding,
                  left: defaultPadding,
                  top: 7.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    homeController.user.value.roleId == 1
                        ? eventController.events.isNotEmpty
                            ? ButtonOutlined(
                                height: 6.h,
                                width: 35.w,
                                onTap: () {
                                  eventController.leaveEvent();
                                },
                                label: "Keluar Event",
                                textColor: colorPrimary,
                              )
                            : const SizedBox()
                        : const SizedBox(),
                    SizedBox(
                      width: 5.w,
                    ),
                    Button(
                      height: 6.h,
                      width: 35.w,
                      onTap: () async {
                        await Storage.removeValue('token').then(
                            (value) => Get.offAllNamed(RouteName.landing));
                      },
                      colorBg: colorPrimary,
                      label: "Keluar",
                      textColor: colorWhite,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
