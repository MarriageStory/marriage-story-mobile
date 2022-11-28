import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:marriage_story_mobile/models/schedule_model.dart';
import 'package:marriage_story_mobile/modules/home/controllers/home_controller.dart';
import '../../../models/event_model.dart';
import '../../../models/payment_model.dart';
import '../../../routes/app_pages.dart';
import '../../../services/payment_service.dart';

class PaymentController extends GetxController {
  final paymentService = Get.put(PaymentService());
  final namaPaymentTextController = TextEditingController();
  final totalPaymentTextController = TextEditingController();
  final dateTextController = TextEditingController();
  final detailPaymentTextController = TextEditingController();
  EventScheduleDataModel? task;
  ScheduleDataModel? taskView;
  final isChekTime = false.obs;

  var paymentId = 0;

  final cekTgl = false.obs;
  DateTime tanggal = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  // Home Controller
  final HomeController homeController = Get.find();

  var payments = <PaymentDataModel>[].obs;

  @override
  void onInit() {
    getPayments();
    super.onInit();
  }

  Future<void> getPayments() async {
    try {
      final eventId = await homeController.getEventId();
      final dataEvent = await paymentService.getPayment(eventId);
      if (dataEvent != null) {
        payments.assignAll(dataEvent);
      }
    } catch (e) {
      e.toString();
    }
  }

  Future<void> createTransaction() async {
    if (namaPaymentTextController.text == "" ||
        totalPaymentTextController.text == "" ||
        dateTextController.text == "" ||
        detailPaymentTextController.text == "") {
      Get.snackbar(
        'Gagal Menambahkan Transaksi !',
        'Tidak Boleh ada yang Kosong',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
    } else {
      try {
        final eventId = await homeController.getEventId();
        var input = <String, dynamic>{
          "nama_payment": namaPaymentTextController.text,
          "total": totalPaymentTextController.text,
          "datetime": dateTextController.text,
          "detail": detailPaymentTextController.text
        };

        await paymentService.createPayment(input, eventId);

        Get.back();
        getPayments();
        Get.snackbar(
          'Sukses !',
          'Berhasil Menambahkan Transaksi Baru',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        );
      } catch (e) {
        Get.snackbar(
          'Gagal Menambahkan Transaksi !',
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

  Future<void> formAddTransaction() async {
    namaPaymentTextController.text = "";
    totalPaymentTextController.text = "";
    dateTextController.text = "";
    detailPaymentTextController.text = "";
    Get.toNamed(RouteName.addTransactionClient, arguments: true);
  }

  Future<void> updateTransaction() async {
    if (namaPaymentTextController.text == "" ||
        totalPaymentTextController.text == "" ||
        dateTextController.text == "" ||
        detailPaymentTextController.text == "") {
      Get.snackbar(
        'Gagal Mengedit Transaksi !',
        'Tidak Boleh ada yang Kosong',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
    } else {
      try {
        log("message");
        final eventId = await homeController.getEventId();
        var input = <String, dynamic>{
          "nama_payment": namaPaymentTextController.text,
          "total": totalPaymentTextController.text,
          "datetime": dateTextController.text,
          "detail": detailPaymentTextController.text
        };

        await paymentService.updatePayment(input, eventId, paymentId);

        Get.snackbar(
          'Sukses !',
          'Berhasil Mengedit Transaksi',
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
          'Gagal Mengedit Transaksi !',
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

  Future<void> formEditTransaction(PaymentDataModel data) async {
    namaPaymentTextController.text = data.namaPayment;
    totalPaymentTextController.text = data.total.toString();
    dateTextController.text = data.datetime.toString();
    detailPaymentTextController.text = data.detail;
    paymentId = data.id;
    tanggal = data.datetime;
    Get.toNamed(RouteName.addTransactionClient, arguments: false);
  }

  Future<void> deleteTransaction(PaymentDataModel data) async {
    try {
      await paymentService.deletePayment(data.eventId, data.id);

      Get.snackbar(
        'Sukses',
        'Berhasil Menghapus Transaksi',
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
        'Gagal Menghapus Transaksi !',
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
}
