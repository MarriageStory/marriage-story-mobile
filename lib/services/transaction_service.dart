import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../constants/string.dart';
import '../models/transaction_model.dart';
import '../utils/storage.dart';

class TransactionService {
  static Future<List<TransactionDataModel>?> getTransactions(
      int idPayment) async {
    final token = Storage.getValue(storageToken);

    var response = await http.get(
        Uri.parse(
            baseURLAPI + "events/" + idPayment.toString() + "/details-payment"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $token",
        });

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body)['data'];
      return jsonResponse.map((e) => TransactionDataModel.fromJson(e)).toList();
    } else {
      throw Exception("Gagal Terhubung ke Server");
    }
  }

  static Future<bool> createTransaction(
      int idPayment, Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var paymentDetail = <String, dynamic>{
      "nama_payment": data["nama_payment"],
      "bayar": data["bayar"],
      "tanggal": data["tanggal"],
      "detail": data["detail"],
      "image": data["image"],
    };

    var response = await http.post(
        Uri.parse(
            baseURLAPI + "events/" + idPayment.toString() + "/details-payment"),
        body: jsonEncode(paymentDetail),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $token",
        });

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Gagal Terhubung ke Server");
    }
  }
}
