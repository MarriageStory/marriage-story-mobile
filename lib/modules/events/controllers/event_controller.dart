import 'package:get/get.dart';
import 'package:marriage_story_mobile/services/event_service.dart';
import '../../../models/event_model.dart';
import 'package:flutter/material.dart';
import '../../../routes/app_pages.dart';

class EventController extends GetxController {
  var events = <EventDataModel>[].obs;
  final TextEditingController namaKlientTextController =
      TextEditingController();
  final TextEditingController tanggalTextController = TextEditingController();
  final TextEditingController jamTextController = TextEditingController();
  final TextEditingController tempatTextController = TextEditingController();
  final TextEditingController totalBayarTextController =
      TextEditingController();
  final TextEditingController statusBayarTextController =
      TextEditingController();
  final TextEditingController jumlahTerbayarTextController =
      TextEditingController();
  final TextEditingController catatanTextController = TextEditingController();
  final TextEditingController paketTextController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> getAllEvent() async {
    try {
      final dataEvent = await EventService.getEvent();
      if (dataEvent != null) {
        events.assignAll(dataEvent);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> createEvent() async {
    try {
      var input = <String, dynamic>{
        'name_client': namaKlientTextController.text,
        'date': tanggalTextController.text,
        'time': jamTextController.text,
        'tempat': tempatTextController.text,
        'total_pembayaran': totalBayarTextController.text,
        'status_pembayaran': statusBayarTextController.text,
        'jumlah_terbayar': jumlahTerbayarTextController.text,
        'note': catatanTextController.text,
        'paket': paketTextController.text,
      };

      var loginResponse = await EventService.createNewEvent(input);

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

  Future<void> updateEvent(int idEvent) async {
    try {
      var input = <String, dynamic>{
        'name_client': namaKlientTextController.text,
        'date': tanggalTextController.text,
        'time': jamTextController.text,
        'tempat': tempatTextController.text,
        'total_pembayaran': totalBayarTextController.text,
        'status_pembayaran': statusBayarTextController.text,
        'jumlah_terbayar': jumlahTerbayarTextController.text,
        'note': catatanTextController.text,
        'paket': paketTextController.text,
      };

      var loginResponse = await EventService.updateEvent(idEvent, input);

      Get.snackbar(
        'Berhasil Mengedit',
        'Event',
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

  Future<void> deleteEvent(int idEvent) async {
    try {
      var loginResponse = await EventService.deleteEvent(idEvent);

      Get.snackbar(
        'Berhasil Mengahpus',
        'Event',
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
