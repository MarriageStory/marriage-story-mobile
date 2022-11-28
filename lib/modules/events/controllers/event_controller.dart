import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/services/event_service.dart';
import '../../../models/event_model.dart';
import '../../../routes/app_pages.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class EventController extends GetxController {
  var events = <EventDataModel>[].obs;
  final eventService = Get.put(EventService());
  final namaClientTextController = TextEditingController();
  final dateTextController = TextEditingController();
  final tempatTextController = TextEditingController();
  final totalBayarTextController = TextEditingController();
  final jumlahTerbayarTextController = TextEditingController();
  final catatanTextController = TextEditingController();
  final genCodeTextController = TextEditingController();
  var selected = [].obs;
  var selectedPackage = [].obs;
  var selectedEvent = 0.obs;
  final isChekTime = false.obs;
  int? idEvent;
  DateTime tanggal = DateTime.now();
  final isLoading = false.obs;

  @override
  void onInit() {
    getAllEvent();
    super.onInit();
  }

  @override
  void onClose() {
    namaClientTextController.dispose();
    dateTextController.dispose();
    tempatTextController.dispose();
    totalBayarTextController.dispose();
    jumlahTerbayarTextController.dispose();
    catatanTextController.dispose();
    super.onClose();
  }

  Future<void> getAllEvent() async {
    isLoading.value = true;
    try {
      final dataEvent = await eventService.getEvent();
      if (dataEvent != null) {
        events.assignAll(dataEvent);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      e.toString();
    }
  }

  Future<void> createEvent() async {
    if (selected.toList().isEmpty) {
      Get.snackbar(
        'Gagal Menambahkan Event !',
        'Masukkan Paket Terlebih Dahulu',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
    } else if (namaClientTextController.text == "" ||
        dateTextController.text == "" ||
        tempatTextController.text == "" ||
        totalBayarTextController.text == "" ||
        catatanTextController.text == "") {
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
          'nama_client': namaClientTextController.text,
          'datetime': dateTextController.text,
          'tempat': tempatTextController.text,
          'total_pembayaran': totalBayarTextController.text,
          'status_pembayaran': "pending",
          'jumlah_terbayar': 0,
          'note': catatanTextController.text,
          'paket': selected.toList(),
        };

        await eventService.createEvent(input);

        Get.snackbar(
          'Sukses !',
          'Berhasil Menambahkan Event Baru',
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
          'Gagal Menambahkan Event !',
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

  Future<void> formAddEvent() async {
    namaClientTextController.text = "";
    tempatTextController.text = "";
    totalBayarTextController.text = "";
    jumlahTerbayarTextController.text = "";
    catatanTextController.text = "";
    Get.toNamed(RouteName.addEvent, arguments: false);
  }

  Future<void> updateEvent() async {
    if (selected.toList().isEmpty) {
      Get.snackbar(
        'Gagal Menambahkan Event !',
        'Masukkan Paket Terlebih Dahulu',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
    } else if (namaClientTextController.text == "" ||
        dateTextController.text == "" ||
        tempatTextController.text == "" ||
        totalBayarTextController.text == "" ||
        catatanTextController.text == "") {
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
          'nama_client': namaClientTextController.text,
          'datetime': dateTextController.text,
          'tempat': tempatTextController.text,
          'total_pembayaran': totalBayarTextController.text,
          'status_pembayaran': "pending",
          'jumlah_terbayar': jumlahTerbayarTextController.text,
          'note': catatanTextController.text,
          'paket': selected.toList(),
        };

        await eventService.updateEvent(input, idEvent!);

        Get.snackbar(
          'Sukses !',
          'Berhasil Mengedit Event ',
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
          'Gagal Mengupdate Event !',
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

  Future<void> formEditEvent(EventDataModel data) async {
    namaClientTextController.text = data.namaClient;
    dateTextController.text = data.datetime.toString();
    tempatTextController.text = data.tempat;
    totalBayarTextController.text = data.totalPembayaran.toString();
    jumlahTerbayarTextController.text = data.jumlahTerbayar.toString();
    catatanTextController.text = data.note;
    idEvent = data.id;
    Get.toNamed(RouteName.addEvent, arguments: true);
  }

  Future<void> deleteEvent(int eventId) async {
    try {
      await eventService.deleteEvent(eventId);

      Get.snackbar(
        'Sukses !',
        'Berhasil Menghapus Event',
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
        'Gagal Menghapus Event !',
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
        dateTextController.text = date.toString();
        isChekTime.value = true;
        tanggal = date;
      },
      currentTime: DateTime.now(),
    );
  }

  Future<void> clearInput() async {
    isChekTime.value = false;
  }

  Future<void> joinEvent() async {
    try {
      var input = <String, dynamic>{
        'gencode': genCodeTextController.text,
      };

      await eventService.joinEvent(input);

      Get.snackbar(
        'Sukses !',
        'Berhasil Join Event',
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
        'Gagal Menemukan Event !',
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

  Future<void> leaveEvent() async {
    try {
      var input = <String, dynamic>{
        'gencode': null,
      };
      await eventService.leaveEvent(input);

      Get.snackbar(
        'Sukses !',
        'Berhasil Keluar dari Event',
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
        'Gagal Keluar dari Event !',
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
