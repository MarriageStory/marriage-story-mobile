import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import '../controllers/login_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:marriage_story_mobile/widgets/background_auth.dart';
import 'package:marriage_story_mobile/routes/routes.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return BackgroundAuth(
      child: SizedBox(
        height: 100.h,
        width: 100.w,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Masuk",
                  style: fontNunito.copyWith(
                    color: colorPink3,
                    fontWeight: extraBold,
                    fontSize: 30,
                    decoration: TextDecoration.none,
                  ),
                ),
                Text(
                  "Selamat datang kembali",
                  style: fontNunito.copyWith(
                    color: colorBlack,
                    fontWeight: semiBold,
                    fontSize: 15,
                    decoration: TextDecoration.none,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: colorPink3, width: 2),
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: colorPink2, width: 1),
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius),
                        ),
                        hintText: 'Email',
                        hintStyle: fontNunito.copyWith(
                          color: colorGrey,
                          fontSize: 14,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Obx(
                      () => TextField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: colorPink3, width: 2),
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: colorPink2, width: 1),
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius),
                          ),
                          hintText: 'Password',
                          hintStyle: fontNunito.copyWith(
                            color: colorGrey,
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () => controller.isObsecured.value =
                                !controller.isObsecured.value,
                            icon: Icon(controller.isObsecured.value
                                ? Icons.visibility_off
                                : Icons.visibility),
                            color: const Color(0xffFB6C90),
                          ),
                        ),
                        obscureText: controller.isObsecured.value,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
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
                        onPressed: () =>
                            Get.offAllNamed(RouteName.navigationWo),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius),
                          ),
                        ),
                        child: Text(
                          "Masuk",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
