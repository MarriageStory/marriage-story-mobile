import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/services/event_service.dart';
import '../../../models/event_model.dart';
import '../../../routes/app_pages.dart';

import 'package:date_time_picker/date_time_picker.dart';

import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:intl/intl.dart';

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

  bool cekJam = false;
  bool cekTgl = false;
  DateTime tanggal = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  int? idEvent;

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

  Future<void> updateEvent() async {
    try {
      var input = <String, dynamic>{
        'nama_client': namaClientTextController.text,
        'datetime': tanggal.toString(),
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

  Future<void> formEditTransaction(EventDataModel data) async {
    namaClientTextController.text = data.namaClient;
    tanggal = data.datetime;
    tempatTextController.text = data.tempat;
    totalBayarTextController.text = data.totalPembayaran.toString();
    jumlahTerbayarTextController.text = data.jumlahTerbayar.toString();
    catatanTextController.text = data.note;
    //  selected.toList(),
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

  // Future<void> selectDate(BuildContext context) async {
  //   // Initial DateTime FIinal Picked
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: tanggal,
  //       firstDate: DateTime(2015),
  //       lastDate: DateTime(2101));

  //   if (picked != null && picked != tanggal) {
  //     cekTgl = true;
  //     dateTextController.text = picked.toString();
  //     tanggal = picked;
  //   }
  // }

  dateTimePickerWidget(BuildContext context) {
    return DatePicker.showDatePicker(
      context,
      dateFormat: 'dd MMMM yyyy HH:mm',
      initialDateTime: tanggal,
      minDateTime: DateTime(2000),
      maxDateTime: DateTime(3000),
      onMonthChangeStartWithFirstDate: true,
      onConfirm: (dateTime, List<int> index) {
        // DateTime selectdate = dateTime;
        cekTgl = true;
        dateTextController.text = dateTime.toString();
        tanggal = dateTime;
        final selIOS = DateFormat('dd-MMM-yyyy - HH:mm').format(tanggal);
        print(selIOS);
      },
    );
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
