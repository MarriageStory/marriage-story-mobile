import 'package:flutter/material.dart';
import '../constants/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BackgroundWelcome extends StatelessWidget {
  final Widget child;
  const BackgroundWelcome({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: colorWhite,
        height: 100.h,
        width: 100.w,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                height: 22.h,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
