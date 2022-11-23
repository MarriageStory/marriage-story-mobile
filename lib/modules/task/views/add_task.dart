import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/theme.dart';
import '../../../models/event_model.dart';
import '../../../widgets/button.dart';
import '../../../widgets/input_form.dart';
import '../../../widgets/number_form.dart';
import '../task.dart';
import '../../../utils/date_time.dart';

class AddTaskView extends StatelessWidget {
  AddTaskView({super.key});
  // final EventDataModel event = Get.arguments;
  final args = Get.arguments;
  final controller = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
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
                    args == false ? "Edit Agenda" : "Tambah Agenda",
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
                height: 4.h,
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "Kelengkapan Acara",
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
              DateTime(
                // labelText: "Date",
                valueText: controller.cekTgl != false || args == false
                    ? controller.tanggal.toString()
                    : "Tanggal Kegiatan",
                valueStyle: TextStyle(
                  color: colorGrey,
                  fontWeight: semiBold,
                  fontSize: 14,
                ),
                onPressed: () {
                  controller.selectDate(context);
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
                height: 5.h,
              ),
              Button(
                height: 6.h,
                width: 100.w,
                onTap: () {
                  if (args == false) {
                    controller.updateTask();
                  } else {
                    controller.createTask(args);
                  }
                },
                colorBg: colorPrimary,
                label: args == false ? "Simpan" : "Tambah",
                textColor: colorWhite,
              )
            ],
          ),
        ),
      ),
    );
  }
}
