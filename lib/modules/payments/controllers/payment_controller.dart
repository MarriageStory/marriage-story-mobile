import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marriage_story_mobile/modules/home/controllers/home_controller.dart';
import 'package:marriage_story_mobile/modules/navigation/controllers/navigation_controller.dart';

import '../../../models/payment_model.dart';
import '../../../routes/app_pages.dart';
import '../../../services/payment_service.dart';

class PaymentController extends GetxController {
  final paymentService = Get.put(PaymentService());
  final namaPaymentTextController = TextEditingController();
  final totalPaymentTextController = TextEditingController();
  final dateTextController = TextEditingController();
  final detailPaymentTextController = TextEditingController();

  var paymentId = 0;

  bool cekJam = false;
  bool cekTgl = false;
  DateTime tanggal = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  // Home Controller
  final HomeController homeController = Get.find();

  var payments = <PaymentDataModel>[].obs;
  // var task = <TransactionDataModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
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
      print(e);
    }
  }

  Future<void> createTransaction() async {
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

  Future<void> formAddTransaction() async {
    namaPaymentTextController.text = "";
    totalPaymentTextController.text = "";
    dateTextController.text = "";
    detailPaymentTextController.text = "";
    Get.toNamed(RouteName.addTransactionClient, arguments: false);
  }

  Future<void> updateTransaction() async {
    try {
      final eventId = await homeController.getEventId();
      var input = <String, dynamic>{
        "nama_payment": namaPaymentTextController.text,
        "total": totalPaymentTextController.text,
        "datetime": dateTextController.text,
        "detail": detailPaymentTextController.text
      };

      await paymentService.updatePayment(input, eventId, paymentId);

      Get.snackbar(
        'Berhasil Mengedit',
        'Transaksi',
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
        'Gagal Edit !',
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

  Future<void> formEditTransaction(PaymentDataModel data) async {
    namaPaymentTextController.text = data.namaPayment;
    totalPaymentTextController.text = data.total.toString();
    dateTextController.text = data.datetime.toString();
    detailPaymentTextController.text = data.detail;
    paymentId = data.id;
    Get.toNamed(RouteName.addTransactionClient, arguments: false);
  }

  Future<void> deleteTransaction(PaymentDataModel data) async {
    try {
      await paymentService.deletePayment(data.eventId, data.id);

      Get.snackbar(
        'Berhasil Menghapus',
        'Transaksi',
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
        'Gagal Hapus !',
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
}
