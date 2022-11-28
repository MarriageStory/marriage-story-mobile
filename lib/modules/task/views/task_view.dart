import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:marriage_story_mobile/constants/theme.dart';
import 'package:marriage_story_mobile/routes/app_pages.dart';
import 'package:marriage_story_mobile/widgets/card_task.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../models/event_model.dart';
import '../task.dart';

class TaskView extends StatelessWidget {
  TaskView({super.key});
  final controller = Get.find<TaskController>();
  final EventDataModel event = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.getAllSchedule(event.id);
    return Scaffold(
      body: SingleChildScrollView(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () => Get.back(),
                              icon: const Icon(
                                Icons.arrow_back_ios_rounded,
                                color: colorWhite,
                              ),
                            ),
                            Text(
                              "Agenda Acara",
                              style: fontNunito.copyWith(
                                color: colorWhite,
                                fontWeight: bold,
                                fontSize: 20,
                              ),
                            ),
                            IconButton(
                              onPressed: () => controller.formAddTask(event.id),
                              icon: const Icon(
                                Icons.add_rounded,
                                color: colorWhite,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7.h,
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
                        event.schedules.length.toString(),
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
                    Obx(
                      () => controller.isLoading.value
                          ? Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Center(
                                child: LoadingAnimationWidget.waveDots(
                                  color: colorPrimary,
                                  size: 7.h,
                                ),
                              ),
                            )
                          : controller.task.isEmpty
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
                                          "Agenda Kosong",
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
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.all(0),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: CardTask(
                                        onTap: () => Get.toNamed(
                                            RouteName.detailTask,
                                            arguments: event.schedules[index]),
                                        label:
                                            controller.task[index].namaKegiatan,
                                        date: DateFormat('EEEE, dd MMMM yyyy')
                                            .format(controller
                                                .task[index].datetime),
                                        time: DateFormat('HH:mm').format(
                                            controller.task[index].datetime),
                                      ),
                                    );
                                  },
                                  itemCount: controller.task.length,
                                ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
