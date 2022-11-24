import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:marriage_story_mobile/routes/app_pages.dart';
import 'package:marriage_story_mobile/widgets/card_task.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/theme.dart';
import '../../../widgets/button.dart';
import '../../../widgets/card_event.dart';
import '../../home/home.dart';
import '../../task/task.dart';
import '../event.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventView extends StatelessWidget {
  EventView({super.key});
  final controller = Get.find<EventController>();
  final controllerHome = Get.find<HomeController>();
  final controllerEvent = Get.find<EventController>();
  final controllerTask = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controllerHome.user.value.roleId == 1
            ? SingleChildScrollView(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 40.h,
                      decoration: BoxDecoration(gradient: colorGradient),
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: defaultPadding,
                          left: defaultPadding,
                          top: 6.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Agenda Acara",
                                  style: fontNunito.copyWith(
                                    color: colorWhite,
                                    fontWeight: bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Center(
                              child: Text(
                                "Jumlah Agenda :",
                                style: fontNunito.copyWith(
                                  color: colorWhite,
                                  fontWeight: semiBold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Center(
                              child: Text(
                                controllerEvent.events.isNotEmpty
                                    ? controllerEvent
                                        .events.first.schedules.length
                                        .toString()
                                    : "0",
                                style: fontNunito.copyWith(
                                  color: colorWhite,
                                  fontWeight: bold,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 35.h),
                      decoration: const BoxDecoration(
                        color: colorWhite,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(defaultBorderRadius2),
                          topRight: Radius.circular(defaultBorderRadius2),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: defaultPadding,
                          left: defaultPadding,
                          top: 4.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Semua Agenda",
                              style: fontNunito.copyWith(
                                color: colorBlack,
                                fontWeight: semiBold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(0),
                              itemBuilder: (BuildContext context, int index) {
                                var events = controllerEvent
                                    .events.first.schedules[index];
                                return Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: CardTask(
                                    onTap: () =>
                                        // controllerTask
                                        //     .validationDetailTask(events, false),
                                        Get.toNamed(RouteName.detailTask,
                                            arguments: events),
                                    label: events.namaKegiatan,
                                    date: DateFormat('dd MMM yyyy')
                                        .format(events.datetime),
                                    time: DateFormat('HH:mm')
                                        .format(events.datetime),
                                  ),
                                );
                              },
                              itemCount: controllerEvent.events.isNotEmpty
                                  ? controllerEvent
                                      .events.first.schedules.length
                                  : 0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 50.h,
                      decoration: BoxDecoration(gradient: colorGradient),
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: defaultPadding,
                          left: defaultPadding,
                          top: 6.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Acara",
                                  style: fontNunito.copyWith(
                                    color: colorWhite,
                                    fontWeight: bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Center(
                              child: Text(
                                "Jumlah Acara :",
                                style: fontNunito.copyWith(
                                  color: colorWhite,
                                  fontWeight: semiBold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Center(
                              child: Obx(
                                () => Text(
                                  controller.events.length.toString(),
                                  style: fontNunito.copyWith(
                                    color: colorWhite,
                                    fontWeight: bold,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Center(
                              child: Button(
                                height: 6.h,
                                width: 75.w,
                                onTap: () {
                                  // Get.toNamed(RouteName.addEvent);
                                  controller.formAddEvent();
                                },
                                colorBg: colorWhite.withOpacity(0.25),
                                label: "Tambah",
                                textColor: colorWhite,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 45.h),
                      decoration: const BoxDecoration(
                        color: colorWhite,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(defaultBorderRadius2),
                          topRight: Radius.circular(defaultBorderRadius2),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: defaultPadding,
                          left: defaultPadding,
                          top: 5.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Semua Acara",
                              style: fontNunito.copyWith(
                                color: colorBlack,
                                fontWeight: semiBold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            // CardEvent(
                            //   label: "Pernikahan",
                            //   date: "23 April 2022",
                            //   allTask: "3",
                            //   eventPack: "akad",
                            //   onTap: () => Get.toNamed(RouteName.detailEvent),
                            // )
                            Obx(
                              () => ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(0),
                                itemBuilder: (BuildContext context, int index) {
                                  String tanggal =
                                      DateFormat('dd MMM yyyy')
                                      .format(
                                          controller
                                              .events[controller
                                                  .selectedEvent.value = index]
                                              .datetime);
                                  return Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: CardEvent(
                                      label: controller
                                          .events[controller
                                              .selectedEvent.value = index]
                                          .namaClient,
                                      date: tanggal,
                                      allTask: controller
                                          .events[index].schedules.length
                                          .toString(),
                                      eventPack: controller
                                          .events[index].paket.first.deskripsi,
                                      onTap: () => Get.toNamed(
                                          RouteName.detailEvent,
                                          arguments: controller.events[
                                              controller.selectedEvent.value =
                                                  index]),
                                    ),
                                  );
                                },
                                itemCount: controller.events.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
