import 'package:flutter/material.dart';
import '../constants/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BackgroundAuth extends StatelessWidget {
  final Widget child;
  const BackgroundAuth({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: colorWhite,
          height: 100.h,
          width: 100.w,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  "assets/images/sign-in-1.png",
                  height: 25.h,
                ),
              ),
              Positioned(
                top: 70,
                left: 228,
                child: Image.asset(
                  "assets/images/sign-in-2.png",
                  height: 13.h,
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
