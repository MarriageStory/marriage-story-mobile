import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home.dart';
import '../../../constants/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeClientEmpty extends StatelessWidget {
  HomeClientEmpty({Key? key}) : super(key: key);
  final HomeClientController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 65.w,
              height: 6.h,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: defaultPadding),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: colorPink3, width: 1),
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: colorPink1, width: 0.1),
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                  ),
                  hintText: 'Masukan Kode Acara',
                  hintStyle: fontNunito.copyWith(
                    color: colorGrey.withOpacity(0.40),
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
            Container(
              width: 22.w,
              height: 6.h,
              decoration: BoxDecoration(
                color: colorPink1,
                borderRadius: BorderRadius.circular(defaultBorderRadius),
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                  ),
                ),
                child: Text(
                  "OK",
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
        SizedBox(
          height: 20.h,
        ),
        Center(
          child: Text(
            "Agenda Kosong",
            style: fontNunito.copyWith(
              color: colorGrey,
              fontSize: 14,
              fontWeight: semiBold,
            ),
          ),
        ),
      ],
    );
  }
}
