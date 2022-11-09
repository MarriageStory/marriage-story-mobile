import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/services/schedule_service.dart';
import '../../../models/event_model.dart';
import '../../../models/schedule_model.dart';
import 'package:flutter/material.dart';

import '../../../routes/app_pages.dart';

class TaskController extends GetxController {
  // final EventDataModel event = Get.arguments;
  final isChecked = false.obs;
  var task = <ScheduleDataModel>[].obs;

  final namaAgendaController = TextEditingController();
  final detailAgendaController = TextEditingController();
  final tanggalAgendaController = TextEditingController();
  final tempatAgendaController = TextEditingController();
  final jamAgendaController = TextEditingController();

  @override
  void onInit() {
    getAllTask();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> getAllTask() async {
    try {
      final dataEvent = await ScheduleService.getSchedules();
      if (dataEvent != null) {
        task.assignAll(dataEvent);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> createTask(EventDataModel event) async {
    try {
      var input = <String, dynamic>{
        'nama_kegiatan': namaAgendaController.text,
        'detail_kegiatan': detailAgendaController.text,
        'tanggal': tanggalAgendaController.text,
        'tempat': tempatAgendaController.text,
        'jam': jamAgendaController.text,
        'status': "pending",
        'gencode': event.gencode,
      };

      await ScheduleService.createNewSchedule(event.id, input);

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

  Future<void> updateTask(int idTask, ScheduleDataModel task) async {
    try {
      var input = <String, dynamic>{
        'nama_kegiatan': namaAgendaController.text,
        'detail_kegiatan': detailAgendaController.text,
        'tanggal': tanggalAgendaController.text,
        'tempat': tempatAgendaController.text,
        'jam': jamAgendaController.text,
        'status': "pending",
        'gencode': task.gencode,
      };

      await ScheduleService.createNewSchedule(idTask, input);

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

  Future<void> deleteTask(int idTask) async {
    try {
      await ScheduleService.deleteSchedule(idTask);

      Get.snackbar(
        'Berhasil Mengahpus',
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
}
