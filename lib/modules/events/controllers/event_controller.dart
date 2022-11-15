import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/services/event_service.dart';
import '../../../models/event_model.dart';
import '../../../routes/app_pages.dart';

class EventController extends GetxController {
  var events = <EventDataModel>[].obs;
  final eventService = Get.put(EventService());
  
  final namaClientTextController = TextEditingController();
  final dateTextController = TextEditingController();
  final tempatTextController = TextEditingController();
  final totalBayarTextController = TextEditingController();
  final jumlahTerbayarTextController = TextEditingController();
  final catatanTextController = TextEditingController();
  var selected = [].obs;
  var selectedPackage = [].obs;
  var selectedEvent = 0.obs;

  bool cekJam = false;
  bool cekTgl = false;
  DateTime tanggal = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

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
    try {
      final dataEvent = await eventService.getEvent();
      if (dataEvent != null) {
        events.assignAll(dataEvent);
      }
    } catch (e) {
      e.toString();
    }
  }

  Future<void> createEvent() async {
    try {
      var input = <String, dynamic>{
        'name_client': namaClientTextController.text,
        'datetime': dateTextController.text,
        'tempat': tempatTextController.text,
        'total_pembayaran': totalBayarTextController.text,
        'status_pembayaran': "pending",
        'jumlah_terbayar': jumlahTerbayarTextController.text,
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
      print(e);
    }
  }

  Future<void> updateEvent(int eventId) async {
    try {
      var input = <String, dynamic>{
        'name_client': namaClientTextController.text,
        'date': dateTextController.text,
        'tempat': tempatTextController.text,
        'total_pembayaran': totalBayarTextController.text,
        'status_pembayaran': "pending",
        'jumlah_terbayar': jumlahTerbayarTextController.text,
        'note': catatanTextController.text,
        'paket': selected.toList(),
      };

      await eventService.updateEvent(input, eventId);

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
      print(e);
    }
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
      dateTextController.text = picked.toString();
      tanggal = picked;
    }
    ;
  }
}
