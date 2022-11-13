import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/services/event_service.dart';
import '../../../models/event_model.dart';
import '../../../routes/app_pages.dart';

class EventController extends GetxController {
  var events = <EventDataModel>[].obs;
  final namaKlientTextController = TextEditingController();
  final tanggalTextController = TextEditingController();
  final jamTextController = TextEditingController();
  final tempatTextController = TextEditingController();
  final totalBayarTextController = TextEditingController();
  final statusBayarTextController = TextEditingController();
  final jumlahTerbayarTextController = TextEditingController();
  final catatanTextController = TextEditingController();
  var selectedPackage1 = [];

  @override
  void onInit() {
    getAllEvent();
    super.onInit();
  }

  Future<void> getAllEvent() async {
    // try {
    //   final dataEvent = await EventService.getEvent();
    //   if (dataEvent != null) {
    //     events.assignAll(dataEvent);
    //   }
    // } catch (e) {
    //   print(e);
    // }
  }

  Future<void> createEvent() async {
    try {
      var input = <String, dynamic>{
        'name_client': namaKlientTextController.text,
        'date': tanggalTextController.text,
        'time': jamTextController.text,
        'tempat': "-",
        'total_pembayaran': totalBayarTextController.text,
        'status_pembayaran': "pending",
        'jumlah_terbayar': "0",
        'note': "-",
        'paket': selectedPackage1.toList(),
      };

      // await EventService.createEvent(input);

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
        'paket': selectedPackage1.toList(),
      };

      // await EventService.updateEvent(idEvent, input);

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
      // await EventService.deleteEvent(idEvent);

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
