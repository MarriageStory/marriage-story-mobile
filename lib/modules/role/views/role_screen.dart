import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import '../controllers/role_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: 100.h,
        color: colorWhite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25.h,
            ),
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                height: 22.h,
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Siapakah Anda?",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: semiBold,
                      )),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius),
                            gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [colorPink2, colorPink3])),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Wo",
                              style: fontNunito.copyWith(
                                color: colorWhite,
                                fontSize: 14,
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                      )),
                      SizedBox(
                        width: 2.w,
                      ),
                      Expanded(
                          child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius),
                            gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [colorPink2, colorPink3])),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Pengantin",
                              style: fontNunito.copyWith(
                                color: colorWhite,
                                fontSize: 14,
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                      ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
