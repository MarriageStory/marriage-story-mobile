import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/theme.dart';

class VendorPack extends StatelessWidget {
  const VendorPack({super.key, required this.label, this.onTap});

  final String label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: colorPrimary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                Icons.auto_awesome_outlined,
                color: colorPrimary,
                size: 7.w,
              ),
            ),
          ),
          Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: fontNunito.copyWith(
              color: colorBlack,
              fontWeight: regular,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
