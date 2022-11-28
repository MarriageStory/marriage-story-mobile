import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:marriage_story_mobile/widgets/button.dart';
import 'package:marriage_story_mobile/widgets/button_outlined.dart';
import 'package:marriage_story_mobile/widgets/detail_format.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/theme.dart';
import '../../../models/event_model.dart';
import '../../../routes/routes.dart';
import '../../../utils/format_angka.dart';
import '../../../widgets/event_pack.dart';
import '../../home/home.dart';
import '../event.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailEventView extends StatelessWidget {
  DetailEventView({super.key});
  final controller = Get.find<EventController>();
  final homeController = Get.find<HomeController>();
  final EventDataModel event = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 45.h,
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
                              "Detail Acara",
                              style: fontNunito.copyWith(
                                color: colorWhite,
                                fontWeight: bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              width: 4.h,
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Center(
                      child: Text(
                        "Pernikahan",
                        style: fontNunito.copyWith(
                          color: colorWhite,
                          fontWeight: semiBold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        event.namaClient,
                        style: fontNunito.copyWith(
                          color: colorWhite,
                          fontWeight: bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Center(
                      child: Text(
                        DateFormat('dd MMMM yyyy').format(event.datetime),
                        style: fontNunito.copyWith(
                          color: colorWhite,
                          fontWeight: medium,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorWhite.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Kode : ${event.gencode}",
                            overflow: TextOverflow.ellipsis,
                            style: fontNunito.copyWith(
                              color: colorWhite,
                              fontWeight: bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 100.w,
              margin: EdgeInsets.only(top: 40.h),
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
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    homeController.user.value.roleId == 1
                        ? const SizedBox()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: colorPrimary,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 2.5.h,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          event.schedules.length.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: fontNunito.copyWith(
                                            color: colorBlack,
                                            fontWeight: bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Flexible(
                                          child: Text(
                                            "Jumlah Agenda ",
                                            overflow: TextOverflow.ellipsis,
                                            style: fontNunito.copyWith(
                                              color: colorGrey,
                                              fontWeight: semiBold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: GestureDetector(
                                  onTap: () => Get.toNamed(RouteName.task,
                                      arguments: event),
                                  child: Text(
                                    "Lihat Agenda",
                                    overflow: TextOverflow.ellipsis,
                                    style: fontNunito.copyWith(
                                      color: colorPrimary,
                                      fontWeight: bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Paket Acara",
                      overflow: TextOverflow.ellipsis,
                      style: fontNunito.copyWith(
                        color: colorGrey,
                        fontWeight: medium,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    FittedBox(
                      fit: BoxFit.fill,
                      child: SizedBox(
                        width: 70.w,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(0),
                          itemCount: event.paket.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                            childAspectRatio: 3.2,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return EventPack(
                              label: event.paket[index].deskripsi,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    DetailFormat(
                      keterangan: "Waktu Acara",
                      label: DateFormat('HH : mm').format(event.datetime),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    DetailFormat(
                        label: FormatAngka.convertToIdr(
                            int.parse(event.totalPembayaran.toString()), 2),
                        keterangan: "Total Pembayaran :"),
                    SizedBox(
                      height: 7.h,
                    ),
                    homeController.user.value.roleId == 1
                        ? const SizedBox()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ButtonOutlined(
                                height: 6.h,
                                width: 42.w,
                                onTap: () {
                                  controller.formEditEvent(event);
                                },
                                label: "Edit",
                                textColor: colorPrimary,
                              ),
                              Button(
                                colorBg: colorPrimary,
                                height: 6.h,
                                width: 42.w,
                                label: "Hapus",
                                textColor: colorWhite,
                                onTap: () => Get.defaultDialog(
                                  title: "Hapus Event",
                                  titlePadding:
                                      const EdgeInsets.only(top: 30.0),
                                  textConfirm: "Hapus",
                                  confirmTextColor: colorWhite,
                                  buttonColor: colorPrimary,
                                  onConfirm: () {
                                    controller.deleteEvent(event.id);
                                  },
                                  textCancel: "Kembali",
                                  cancelTextColor: colorPrimary,
                                  radius: 15,
                                  contentPadding: const EdgeInsets.all(30),
                                  content: Center(
                                    child: Text(
                                      "Apakah Anda Ingin Menghapus Event Ini?",
                                      style: fontNunito.copyWith(
                                        color: colorGrey,
                                        fontWeight: semiBold,
                                        fontSize: 16,
                                      ),
                                    ),
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
      ),
    );
  }
}
