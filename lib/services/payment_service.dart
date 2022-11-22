import 'dart:async';
import 'base_service.dart';
import '../models/payment_model.dart';

class PaymentService extends BaseService {
  Future<List<PaymentDataModel>?> getPayment(int eventId) async {
    try {
      final response = await get("/events/$eventId/payments");

      if (response.statusCode == 200) {
        List jsonResponse = response.body['data'];
        return jsonResponse.map((e) => PaymentDataModel.fromJson(e)).toList();
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> createPayment(Map<String, dynamic> data, int eventId) async {
    try {
      var dataPayment = <String, dynamic>{
        'nama_payment': data['nama_payment'],
        'total': data['total'],
        'datetime': data['datetime'],
        'detail': data['detail'],
      };
      final response =
          await post("/events/$eventId/payments/create", dataPayment);
      if (response.statusCode == 201) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updatePayment(
      Map<String, dynamic> data, int eventId, int paymentId) async {
    try {
      var dataPayment = <String, dynamic>{
        'nama_payment': data['nama_payment'],
        'total': data['total'],
        'datetime': data['datetime'],
        'detail': data['detail'],
      };
      final response =
          await put("/events/$eventId/payments/update/$paymentId", dataPayment);

      if (response.statusCode == 200) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deletePayment(int eventId, int paymentId) async {
    try {
      final response =
          await delete("/events/$eventId/payments/delete/$paymentId");
      if (response.statusCode == 200) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }
}
