import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
                    onPressed: () {
                      controller.clearInput();
                      Get.back();
                    },
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
                height: 10.h,
              ),
              Text(
                "Kelengkapan Acara",
                style: fontNunito.copyWith(
                  color: colorBlack,
                  fontWeight: semiBold,
                  fontSize: 16,
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
              Obx(() => DateTime(
                    // labelText: "Date",
                    valueText:
                        controller.isChekTime.value == true || args == false
                            ? DateFormat('dd MMMM yyyy - HH:mm')
                                .format(controller.tanggal)
                            : "Tanggal Acara",
                    valueStyle: TextStyle(
                      color:
                          controller.isChekTime.value == true || args == false
                              ? colorBlack
                              : colorPrimary,
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                    onPressed: () {
                      controller.dateTimePicker(context);
                    },
                  )),
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
                height: 25.h,
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
