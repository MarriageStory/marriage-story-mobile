import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/modules/navigation/controllers/navigation_controller.dart';
import 'package:marriage_story_mobile/widgets/Icon_navbar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import 'package:marriage_story_mobile/modules/events/event.dart';
import 'package:marriage_story_mobile/modules/home/home.dart';
import 'package:marriage_story_mobile/modules/other/other.dart';
import 'package:marriage_story_mobile/modules/payments/payments.dart';

class NavigationView extends StatelessWidget {
  NavigationView({Key? key}) : super(key: key);
  final NavigationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<NavigationController>(
        builder: (c) {
          return IndexedStack(
            index: controller.tabIndex,
            children: [
              HomeView(),
              EventView(),
              PaymentWeddingOrganizerView(),
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
            child: GetBuilder<NavigationController>(
              init: NavigationController(),
              builder: (controller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconNavbar(
                      text: "Home",
                      iconEnable: "assets/images/home1.png",
                      iconDisable: "assets/images/home2.png",
                      selected: controller.tabIndex == 0 ? true : false,
                      onPressed: () {
                        controller.changeTabIndex(0);
                      },
                    ),
                    IconNavbar(
                      text: "Acara",
                      iconEnable: "assets/images/acara1.png",
                      iconDisable: "assets/images/acara2.png",
                      selected: controller.tabIndex == 1 ? true : false,
                      onPressed: () {
                        controller.changeTabIndex(1);
                      },
                    ),
                    IconNavbar(
                      text: "Pembayaran",
                      iconEnable: "assets/images/bayar1.png",
                      iconDisable: "assets/images/bayar2.png",
                      selected: controller.tabIndex == 2 ? true : false,
                      onPressed: () {
                        controller.changeTabIndex(2);
                      },
                    ),
                    IconNavbar(
                      text: "Lainnya",
                      iconEnable: "assets/images/lainnya1.png",
                      iconDisable: "assets/images/lainnya2.png",
                      selected: controller.tabIndex == 3 ? true : false,
                      onPressed: () {
                        controller.changeTabIndex(3);
                      },
                    ),
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
