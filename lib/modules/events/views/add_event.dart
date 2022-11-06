import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:marriage_story_mobile/widgets/button.dart';
import 'package:marriage_story_mobile/widgets/input_form.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/theme.dart';
import '../event.dart';
import 'package:get/get.dart';

class AddEventView extends StatelessWidget {
  AddEventView({super.key});
  final controller = Get.find<EventController>();

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
                    "Tambah Acara",
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
                height: 4.h,
              ),
              Text(
                "Paket Acara",
                style: fontNunito.copyWith(
                  color: colorBlack,
                  fontWeight: semiBold,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              MultiSelectContainer(
                textStyles: const MultiSelectTextStyles(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: colorPrimary,
                    fontSize: 14,
                  ),
                ),
                itemsDecoration: MultiSelectDecorations(
                  decoration: BoxDecoration(
                      color: colorWhite,
                      border: Border.all(color: colorPrimary),
                      borderRadius: BorderRadius.circular(20)),
                  selectedDecoration: BoxDecoration(
                      color: colorPrimary,
                      border: Border.all(color: colorPrimary),
                      borderRadius: BorderRadius.circular(5)),
                ),
                items: [
                  MultiSelectCard(
                      value: 'Pre - Wedding', label: 'Pre - Wedding'),
                  MultiSelectCard(value: 'Engagement', label: 'Engagement'),
                  MultiSelectCard(value: 'Akad', label: 'Akad'),
                  MultiSelectCard(value: 'Panggih', label: 'Panggih'),
                  MultiSelectCard(value: 'Resepsi', label: 'Resepsi'),
                ],
                onChange: (allSelectedItems, selectedItem) {
                  
                },
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "Kelengkapan Acara",
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
                label: "Nama Pengantin",
                inputController: controller.testTextController,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              InputForm(
                label: "Tanggal Acara",
                inputController: controller.testTextController,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              InputForm(
                label: "Waktu Acara",
                inputController: controller.testTextController,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              InputForm(
                label: "Total Pembayaran",
                inputController: controller.testTextController,
              ),
              SizedBox(
                height: 5.h,
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
