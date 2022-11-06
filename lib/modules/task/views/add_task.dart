import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:marriage_story_mobile/widgets/button.dart';
import 'package:marriage_story_mobile/widgets/input_form.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/theme.dart';
import '../task.dart';
import 'package:get/get.dart';

class AddTaskView extends StatelessWidget {
  AddTaskView({super.key});
  final controller = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: defaultPadding,
            left: defaultPadding,
            top: 6.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: colorBlack,
                    ),
                  ),
                  Text(
                    "Tambah Agenda",
                    style: fontNunito.copyWith(
                      color: colorBlack,
                      fontWeight: semiBold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 4.h,
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Kelengkapan Agenda",
                style: fontNunito.copyWith(
                  color: colorBlack,
                  fontWeight: semiBold,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              InputForm(
                label: "Nama Kegiatan",
                inputController: controller.testTextController,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              InputForm(
                label: "Tanggal Kegiatan",
                inputController: controller.testTextController,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              InputForm(
                label: "Waktu Kegiatan",
                inputController: controller.testTextController,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              InputForm(
                label: "Tempat Kegiatan",
                inputController: controller.testTextController,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              InputForm(
                label: "Detail Kegiatan",
                inputController: controller.testTextController,
              ),
              SizedBox(
                height: 20.h,
              ),
              Button(
                height: 6.h,
                width: 100.w,
                onTap: () {},
                colorBg: colorPrimary,
                label: "Tambah",
                textColor: colorWhite,
              )
            ],
          ),
        ),
      ),
    );
  }
}
