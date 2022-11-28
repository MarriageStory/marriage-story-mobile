import 'dart:developer';

import 'package:get/get.dart';
import 'package:marriage_story_mobile/services/schedule_service.dart';
import '../../../models/event_model.dart';
import '../../../models/schedule_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../../../routes/app_pages.dart';
import '../../events/event.dart';

class TaskController extends GetxController {
  var task = <ScheduleDataModel>[].obs;
  final taskService = Get.put(ScheduleService());
  final EventController eventController = Get.find();
  final isChecked = false.obs;
  final isLoading = false.obs;
  final checkClass = false.obs;

  int? eventId;
  int? taskId;

  final namaAgendaController = TextEditingController();
  final detailAgendaController = TextEditingController();
  final dateAgendaController = TextEditingController();
  final tempatAgendaController = TextEditingController();
  final jamAgendaController = TextEditingController();
  final isChekTime = false.obs;

  DateTime tanggal = DateTime.now();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getAllSchedule(int event) async {
    isLoading.value = true;
    try {
      final dataTask = await taskService.getSchedule(event);
      if (dataTask != null) {
        task.assignAll(dataTask);
      }
      isLoading.value = false;
    } catch (e) {
      e.toString();
      isLoading.value = false;
    }
  }

  Future<void> createTask(int eventId) async {
    if (namaAgendaController.text == "" ||
        detailAgendaController.text == "" ||
        dateAgendaController.text == "" ||
        tempatAgendaController.text == "") {
      Get.snackbar(
        'Gagal Menambahkan Event !',
        'Tidak boleh ada yang kosong',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
    } else {
      try {
        var input = <String, dynamic>{
          'nama_kegiatan': namaAgendaController.text,
          'detail_kegiatan': detailAgendaController.text,
          'datetime': dateAgendaController.text,
          'tempat': tempatAgendaController.text,
        };

        await taskService.createSchedule(input, eventId);

        Get.snackbar(
          'Sukses !',
          'Berhasil Menambahkan Agneda Baru',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        );
        Get.offAllNamed(RouteName.navigation);
      } catch (e) {
        Get.snackbar(
          'Gagal Menambahkan Agenda !',
          '$e',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          icon: const Icon(
            Icons.cancel,
            color: Colors.white,
          ),
        );
      }
    }
  }

  Future<void> formAddTask(int eventId) async {
    namaAgendaController.text = "";
    detailAgendaController.text = "";
    dateAgendaController.text = "";
    tempatAgendaController.text = "";
    jamAgendaController.text = "";
    Get.toNamed(RouteName.addTask, arguments: eventId);
  }

  Future<void> updateTask() async {
    if (namaAgendaController.text == "" ||
        detailAgendaController.text == "" ||
        dateAgendaController.text == "" ||
        tempatAgendaController.text == "") {
      Get.snackbar(
        'Gagal Menambahkan Event !',
        'Tidak boleh ada yang kosong',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
    } else {
      try {
        var input = <String, dynamic>{
          'nama_kegiatan': namaAgendaController.text,
          'detail_kegiatan': detailAgendaController.text,
          'datetime': tanggal.toString(),
          'tempat': tempatAgendaController.text,
        };

        await taskService.updateSchedule(input, eventId!, taskId!);

        Get.snackbar(
          'Sukses !!',
          'Berhasil Mengubah Agenda',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        );
        Get.offAllNamed(RouteName.navigation);
      } catch (e) {
        Get.snackbar(
          'Gagal Mengubah Agenda !',
          '$e',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          icon: const Icon(
            Icons.cancel,
            color: Colors.white,
          ),
        );
      }
    }
  }

  Future<void> formEditTask(EventScheduleDataModel? data) async {
    namaAgendaController.text = data!.namaKegiatan;
    detailAgendaController.text = data.detailKegiatan;
    dateAgendaController.text = data.datetime.toString();
    tanggal = data.datetime;
    tempatAgendaController.text = data.tempat;
    jamAgendaController.text = data.datetime.toString();
    eventId = data.eventId;
    taskId = data.id;
    Get.toNamed(RouteName.addTask, arguments: false);
  }

  Future<void> deleteTask(EventScheduleDataModel? data) async {
    try {
      await taskService.deleteSchedule(data!.eventId, data.id);

      Get.snackbar(
        'Sukses !',
        'Berhasil Menghapus Agenda',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      );
      Get.offAllNamed(RouteName.navigation);
    } catch (e) {
      Get.snackbar(
        'Gagal Menghapus Agenda !',
        '$e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
    }
  }

  Future<void> dateTimePicker(BuildContext context) {
    isChekTime.value = false;
    return DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      locale: LocaleType.id,
      onConfirm: (date) {
        log('confirm $date');
        dateAgendaController.text = date.toString();
        isChekTime.value = true;
        tanggal = date;
      },
      currentTime: DateTime.now(),
    );
  }

  Future<void> clearInput() async {
    isChekTime.value = false;
  }
}
