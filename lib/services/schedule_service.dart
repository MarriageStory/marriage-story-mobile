import 'dart:async';
import 'dart:developer';
import '../models/schedule_model.dart';
import 'base_service.dart';

class ScheduleService extends BaseService {
  Future<List<ScheduleDataModel>?> getSchedule(int eventId) async {
    try {
      final response = await get("/events/$eventId/schedules");

      if (response.statusCode == 200) {
        List jsonResponse = response.body['data'];
        return jsonResponse.map((e) => ScheduleDataModel.fromJson(e)).toList();
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> createSchedule(Map<String, dynamic> data, int eventId) async {
    try {
      var dataSchedule = <String, dynamic>{
        'nama_kegiatan': data['nama_kegiatan'],
        'detail_kegiatan': data['detail_kegiatan'],
        'datetime': data['datetime'],
        'tempat': data['tempat'],
      };

      final response =
          await post("/events/$eventId/schedules/create", dataSchedule);
      if (response.statusCode == 201) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateSchedule(
      Map<String, dynamic> data, int eventId, int scheduleId) async {
    try {
      var dataSchedule = <String, dynamic>{
        'nama_kegiatan': data['nama_kegiatan'],
        'detail_kegiatan': data['detail_kegiatan'],
        'datetime': data['datetime'],
        'tempat': data['tempat'],
      };

      final response = await put(
          "events/$eventId/schedules/update/$scheduleId", dataSchedule);
      if (response.statusCode == 200) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteSchedule(int eventId, int scheduleId) async {
    try {
      final response =
          await delete("events/$eventId/schedules/delete/$scheduleId");

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
