import 'package:marriage_story_mobile/models/event_model.dart';
import './base_service.dart';
import 'dart:async';

class EventService extends BaseService {
  Future<List<EventDataModel>?> getEvent() async {
    try {
      final response = await get("/events");

      if (response.statusCode == 200) {
        List jsonResponse = response.body['data'];
        return jsonResponse.map((e) => EventDataModel.fromJson(e)).toList();
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }


  Future<bool> createEvent(Map<String, dynamic> data) async {
    try {
      var dataEvent = <String, dynamic>{
        'nama_client': data['nama_client'],
        'datetime': data['datetime'],
        'tempat': data['tempat'],
        'total_pembayaran': data['total_pembayaran'],
        'status_pembayaran': data['status_pembayaran'],
        'jumlah_terbayar': data['jumlah_terbayar'],
        'note': data['note'],
        'paket': data['paket'],
      };
      final response = await post("/events/create", dataEvent);
      if (response.statusCode == 201) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> joinEvent(Map<String, dynamic> data) async {
    try {
      var dataEvent = <String, dynamic>{
        'gencode': data['gencode'],
      };
      final response = await post("/events/join", dataEvent);
      if (response.statusCode == 201) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

Future<bool> leaveEvent(Map<String, dynamic> data) async {
    try {
      var dataEvent = <String, dynamic>{
        'gencode': data['gencode'],
      };
      final response = await post("/events/leave", dataEvent);
      if (response.statusCode == 200) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }


    Future<bool> updateEvent(Map<String, dynamic> data,int eventId) async {
    try {
      var dataEvent = <String, dynamic>{
        'nama_client': data['nama_client'],
        'datetime': data['datetime'],
        'tempat': data['tempat'],
        'total_pembayaran': data['total_pembayaran'],
        'status_pembayaran': data['status_pembayaran'],
        'jumlah_terbayar': data['jumlah_terbayar'],
        'note': data['note'],
        'paket': data['paket'],
      };
      final response = await post("/events/update/$eventId", dataEvent);

      if (response.statusCode == 200) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteEvent(int eventId) async{
    try {
      final response = await delete("/events/delete/$eventId");
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
