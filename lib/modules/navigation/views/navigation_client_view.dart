import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import 'package:marriage_story_mobile/modules/events/event.dart';
import 'package:marriage_story_mobile/modules/home/home.dart';
import 'package:marriage_story_mobile/modules/navigation/navigation.dart';
import 'package:marriage_story_mobile/modules/other/other.dart';
import 'package:marriage_story_mobile/modules/payments/payments.dart';

class NavigationClientView extends StatelessWidget {
  NavigationClientView({Key? key}) : super(key: key);
  final NavigationClientController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<NavigationClientController>(
        builder: (c) {
          return IndexedStack(
            index: controller.tabIndex,
            children: [
              HomeClientView(),
              EventClientView(),
              PaymentClientView(),
              OtherView(),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: colorWhite,
        child: SizedBox(
          height: 8.h,
          width: 100.w,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: GetBuilder<NavigationClientController>(
              init: NavigationClientController(),
              builder: (controller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => controller.changeTabIndex(0),
                      icon: Icon(Icons.home),
                    ),
                    IconButton(
                      onPressed: () => controller.changeTabIndex(1),
                      icon: Icon(Icons.task),
                    ),
                    IconButton(
                      onPressed: () => controller.changeTabIndex(2),
                      icon: Icon(Icons.payment),
                    ),
                    IconButton(
                      onPressed: () => controller.changeTabIndex(3),
                      icon: Icon(Icons.other_houses),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
