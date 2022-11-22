import 'dart:developer';

import 'package:get/get.dart';
import 'package:marriage_story_mobile/services/schedule_service.dart';
import '../../../models/event_model.dart';
import '../../../models/schedule_model.dart';
import 'package:flutter/material.dart';

import '../../../routes/app_pages.dart';
import '../../events/event.dart';

class TaskController extends GetxController {
  // final EventDataModel event = Get.arguments;
  var task = <ScheduleDataModel>[].obs;
  final taskService = Get.put(ScheduleService());
  final EventController eventController = Get.find();
  final isChecked = false.obs;
  final isLoading = false.obs;

  int? eventId;
  int? taskId;

  final namaAgendaController = TextEditingController();
  final detailAgendaController = TextEditingController();
  final dateAgendaController = TextEditingController();
  final tempatAgendaController = TextEditingController();
  final jamAgendaController = TextEditingController();

  bool cekJam = false;
  bool cekTgl = false;
  DateTime tanggal = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

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
      print(e);
      isLoading.value = false;
    }
  }

  Future<void> createTask(int eventId) async {
    try {
      var input = <String, dynamic>{
        'nama_kegiatan': namaAgendaController.text,
        'detail_kegiatan': detailAgendaController.text,
        'datetime': dateAgendaController.text,
        'tempat': tempatAgendaController.text,
      };

      await taskService.createSchedule(input, eventId);

      Get.snackbar(
        'Berhasil Menambahkan',
        'Event Baru',
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
        'Gagal Masuk !',
        '$e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
      print(e);
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
    try {
      var input = <String, dynamic>{
        'nama_kegiatan': namaAgendaController.text,
        'detail_kegiatan': detailAgendaController.text,
        'datetime': tanggal.toString(),
        'tempat': tempatAgendaController.text,
      };

      // await ScheduleService.createNewSchedule(idTask, input);
      await taskService.updateSchedule(input, eventId!, taskId!);

      Get.snackbar(
        'Berhasil Mengedit',
        'Agenda',
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
        'Gagal Masuk !',
        '$e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
      print(e);
    }
  }

  Future<void> formEditTask(EventScheduleDataModel data) async {
    namaAgendaController.text = data.namaKegiatan;
    detailAgendaController.text = data.detailKegiatan;
    dateAgendaController.text = data.datetime.toString();
    tanggal = data.datetime;
    tempatAgendaController.text = data.tempat;
    jamAgendaController.text = data.datetime.toString();
    eventId = data.eventId;
    taskId = data.id;
    Get.toNamed(RouteName.addTask, arguments: false);
  }

  Future<void> deleteTask(EventScheduleDataModel data) async {
    try {
      await taskService.deleteSchedule(data.eventId, data.id);

      Get.snackbar(
        'Berhasil Menghapus',
        'Agenda',
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
        'Gagal Masuk !',
        '$e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
      print(e);
    }
  }

  Future<void> selectDate(BuildContext context) async {
    // Initial DateTime FIinal Picked
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: tanggal,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));

    if (picked != null && picked != tanggal) {
      cekTgl = true;
      dateAgendaController.text = picked.toString();
      tanggal = picked;
    }
    ;
  }
}
