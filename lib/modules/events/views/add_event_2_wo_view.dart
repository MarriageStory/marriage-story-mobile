import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import 'package:marriage_story_mobile/routes/app_pages.dart';
import 'package:marriage_story_mobile/widgets/text_field_input.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../event.dart';

class AddEvent2View extends StatelessWidget {
  AddEvent2View({Key? key}) : super(key: key);
  final EventWeddingOrganizerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
              IconButton(
                icon: const Icon(Icons.arrow_back_rounded, size: 30),
                onPressed: () {},
              ),
              Container(
                margin: const EdgeInsets.only(left: defaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tambah",
                      style: fontNunito.copyWith(
                        color: colorBlack,
                        fontWeight: bold,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "Acara",
                      style: fontNunito.copyWith(
                        color: colorBlack,
                        fontWeight: bold,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              Text(
                "Kelengkapan Acara",
                style: fontNunito.copyWith(
                  color: colorBlack,
                  fontWeight: semiBold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const TextFieldInput(
                    title: "Nama Pengantin",
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  const TextFieldInput(
                    title: "Tanggal Acara",
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  const TextFieldInput(
                    title: "Waktu Acara",
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  const TextFieldInput(
                    title: "Tempat Acara",
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  const TextFieldInput(
                    title: "Total Pembayaran",
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  const TextFieldInput(
                    title: "Catatan",
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 47.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [colorPink2, colorPink3],
                      ),
                      borderRadius: BorderRadius.circular(defaultBorderRadius),
                    ),
                    child: ElevatedButton(
                      onPressed: () =>
                          Get.toNamed(RouteName.addEventWeddingOrganizer3),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: Text(
                        "Selanjutnya",
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
            ],
          ),
        ),
      ),
    );
  }
}
