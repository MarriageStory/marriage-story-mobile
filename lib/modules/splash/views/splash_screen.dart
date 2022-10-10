import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../controllers/splash_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:marriage_story_mobile/constants/theme.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [colorPink2, colorPink3],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Center(
              child: Image.asset(
                "assets/images/logo-white.png",
                height: 22.h,
              ),
            )
          ],
        ),
      ),
    );
  }
}
