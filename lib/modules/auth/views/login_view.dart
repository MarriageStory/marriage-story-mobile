import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import 'package:marriage_story_mobile/widgets/button.dart';
import 'package:marriage_story_mobile/widgets/input_form.dart';
import '../controllers/login_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: defaultPadding,
            left: defaultPadding,
            top: 10.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Selamat Datang",
                style: fontNunito.copyWith(
                  color: colorPrimary,
                  fontWeight: semiBold,
                  fontSize: 25,
                ),
              ),
              Text(
                "Kembali",
                style: fontNunito.copyWith(
                  color: colorPrimary,
                  fontWeight: semiBold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Center(
                child: Image.asset(
                  "assets/images/login.png",
                  height: 70.w,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              InputForm(
                label: "Email",
                inputController: controller.emailTextController,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Obx(
                () => TextFormField(
                  obscureText: controller.isObsecured.value,
                  controller: controller.passwordTextController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () => controller.isObsecured.value =
                          !controller.isObsecured.value,
                      icon: Icon(controller.isObsecured.value
                          ? Icons.visibility_off
                          : Icons.visibility),
                      color: colorPrimary,
                    ),
                    labelStyle: TextStyle(
                      color: colorPrimary,
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                    labelText: "Password",
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(defaultBorderRadius)),
                      borderSide: BorderSide(
                        color: colorPrimary,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(defaultBorderRadius)),
                      borderSide: BorderSide(
                        color: colorPrimary,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Button(
                height: 6.h,
                width: 100.w,
                onTap: () {
                  controller.login();
                },
                colorBg: colorPrimary,
                label: "Masuk",
                textColor: colorWhite,
              )
            ],
          ),
        ),
      ),
    );
  }
}
