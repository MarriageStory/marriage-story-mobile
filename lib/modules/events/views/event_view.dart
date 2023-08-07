import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:marriage_story_mobile/routes/app_pages.dart';
import 'package:marriage_story_mobile/widgets/card_task.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/theme.dart';
import '../../../widgets/button.dart';
import '../../../widgets/card_event.dart';
import '../../../widgets/event_pack.dart';
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
                            controllerEvent.events.isNotEmpty
                                ? ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(0),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var events = controllerEvent
                                          .events.first.schedules[index];
                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5),
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
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/empty.png",
                                        height: 50.w,
                                      ),
                                      Center(
                                        child: Text(
                                          "Masukan Kode Terlebih Dahulu",
                                          style: fontNunito.copyWith(
                                            color: colorBlack,
                                            fontWeight: semiBold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
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
                              child: Text(
                                controller.events.length.toString(),
                                style: fontNunito.copyWith(
                                  color: colorWhite,
                                  fontWeight: bold,
                                  fontSize: 30,
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
                            controller.events.isEmpty
                                ? Padding(
                                    padding: EdgeInsets.only(top: 3.h),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/images/empty.png",
                                          height: 50.w,
                                        ),
                                        Center(
                                          child: Text(
                                            "Acara Kosong",
                                            style: fontNunito.copyWith(
                                              color: colorBlack,
                                              fontWeight: semiBold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(0),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      String tanggal =
                                          DateFormat('dd MMMM yyyy').format(
                                              controller
                                                  .events[controller
                                                      .selectedEvent
                                                      .value = index]
                                                  .datetime);
                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: CardEvent(
                                          label: controller
                                              .events[controller
                                                  .selectedEvent.value = index]
                                              .namaClient,
                                          date: tanggal,
                                          allTask: controller
                                              .events[index].schedules.length
                                              .toString(),
                                          onTap: () => Get.toNamed(
                                              RouteName.detailEvent,
                                              arguments: controller.events[
                                                  controller.selectedEvent
                                                      .value = index]),
                                          eventPack: FittedBox(
                                            fit: BoxFit.fill,
                                            child: SizedBox(
                                              width: 70.w,
                                              child: GridView.builder(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                padding:
                                                    const EdgeInsets.all(0),
                                                itemCount: controller
                                                    .events[index].paket.length,
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  crossAxisSpacing: 5.0,
                                                  mainAxisSpacing: 5.0,
                                                  childAspectRatio: 3.2,
                                                ),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index2) {
                                                  return EventPack(
                                                    label: controller
                                                        .events[index]
                                                        .paket[index2]
                                                        .deskripsi,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: controller.events.length,
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
