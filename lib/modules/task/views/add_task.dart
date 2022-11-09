// import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:marriage_story_mobile/widgets/button.dart';
import 'package:marriage_story_mobile/widgets/input_form.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/theme.dart';
import '../../../models/event_model.dart';
import '../../../models/schedule_model.dart';
import '../../../utils/dateTime.dart';
import '../task.dart';
import 'package:get/get.dart';

class AddTaskView extends StatefulWidget {
  AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _BodyState();
}

class _BodyState extends State<AddTaskView> {
  final EventDataModel event = Get.arguments;
  EventDataModel? cek;
  final controller = Get.find<TaskController>();

  final TextStyle valueStyle = TextStyle(
      color: Color(0xff828282), fontWeight: FontWeight.w500, fontSize: 14);
  bool cekJam = false;
  bool cekTgl = false;
  DateTime tanggal = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  void showTime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        cekJam = true;
        controller.jamAgendaController.text = value!.format(context).toString();
      });
    });
  }

  Future<Null> _selectDate(BuildContext context) async {
    // Initial DateTime FIinal Picked
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: tanggal,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));

    if (picked != null && picked != tanggal)
      setState(() {
        cekTgl = true;
        controller.tanggalAgendaController.text = picked.toString();
        tanggal = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    // final ScheduleDataModel? task = Get.arguments;
    // if (task != Null) {
    //   controller.namaAgendaController.text = task!.namaKegiatan;
    //   controller.detailAgendaController.text = task.detailKegiatan;
    //   controller.tanggalAgendaController.text = task.tanggal.toString();
    //   controller.tempatAgendaController.text = task.tempat;
    //   controller.jamAgendaController.text = task.jam;
    // }
    // if (event  EventDataModel) {
    //   print("tidak nukll");
    //   print(Get.arguments);
    // }
    if (event != null) {
      print("benerrr");
      // print(instanceof(o, type))
      // print(instanceof(
      //     cek,
      //     EventDataModel(
      //         id: 0,
      //         nameClient: "",
      //         date: DateTime.now(),
      //         time: "",
      //         tempat: "",
      //         totalPembayaran: 1,
      //         statusPembayaran: "",
      //         jumlahTerbayar: "",
      //         note: "",
      //         gencode: "",
      //         createdAt: DateTime.now(),
      //         updatedAt: DateTime.now())));
    } else {
      print("salah");
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: defaultPadding,
            left: defaultPadding,
            top: 6.h,
          ),
          child: Column(
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
                      color: colorBlack,
                    ),
                  ),
                  Text(
                    "Tambah Agenda",
                    style: fontNunito.copyWith(
                      color: colorBlack,
                      fontWeight: semiBold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 4.h,
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Kelengkapan Agenda",
                style: fontNunito.copyWith(
                  color: colorBlack,
                  fontWeight: semiBold,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              InputForm(
                label: "Nama Kegiatan",
                inputController: controller.namaAgendaController,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              // InputForm(
              //   label: "Tanggal Kegiatan",
              //   inputController: controller.tanggalAgendaController,
              // ),
              dateTime(
                // labelText: "Date",
                valueText:
                    cekTgl != false ? tanggal.toString() : "Tanggal Acara",
                valueStyle: valueStyle,
                onPressed: () {
                  _selectDate(context);
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),
              // InputForm(
              //   label: "Waktu Kegiatan",
              //   inputController: controller.jamAgendaController,
              // ),
              dateTime(
                // labelText: "Date",
                valueText: cekJam != false
                    ? controller.jamAgendaController.text
                    : "Waktu Acara",
                valueStyle: valueStyle,
                onPressed: () {
                  showTime();
                },
              ),
              SizedBox(
                height: 1.5.h,
              ),
              InputForm(
                label: "Tempat Kegiatan",
                inputController: controller.tempatAgendaController,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              InputForm(
                label: "Detail Kegiatan",
                inputController: controller.detailAgendaController,
              ),
              SizedBox(
                height: 20.h,
              ),
              Button(
                height: 6.h,
                width: 100.w,
                onTap: () {
                  controller.createTask(event);
                },
                colorBg: colorPrimary,
                label: "Tambah",
                textColor: colorWhite,
              )
            ],
          ),
        ),
      ),
    );
  }
}
