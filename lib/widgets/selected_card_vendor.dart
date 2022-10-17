import 'package:flutter/material.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectedCardVendor extends StatelessWidget {
  final String title;
  const SelectedCardVendor({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40.w,
      height: 12.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              title,
              style: fontNunito.copyWith(
                fontWeight: extraBold,
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}
