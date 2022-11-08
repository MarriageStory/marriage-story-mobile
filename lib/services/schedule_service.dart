import 'dart:convert';

import 'package:http/http.dart' as http;
import '../constants/string.dart';
import '../models/schedule_model.dart';
import '../utils/storage.dart';

class ScheduleService {
  static Future<List<ScheduleDataModel>?> getSchedules() async {
    final token = Storage.getValue(storageToken);

    var response = await http.get(
      Uri.parse(baseURLAPI + "schedules"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token",
      },
    );
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body)['data'];
      return jsonResponse.map((e) => ScheduleDataModel.fromJson(e)).toList();
    } else {
      throw jsonDecode(response.body);
    }
  }

  static Future<bool> createNewSchedule(
      int idEvent, Map<String, dynamic> data) async {
    final token = Storage.getValue(storageToken);

    var schedule = <String, dynamic>{
      "nama_kegiatan": data["nama_kegiatan"],
      "detail_kegiatan": data["detail_kegiatan"],
      "tanggal": data["tanggal"],
      "tempat": data["tempat"],
      "jam": data["jam"],
      "status": data["status"],
      "gencode": data["gencode"],
    };

    var response = await http.post(
        Uri.parse(baseURLAPI + "events/" + idEvent.toString() + "/schedule"),
        body: jsonEncode(schedule),
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

  static Future<bool> updateSchedule(int id, Map<String, dynamic> data) async {
    final token = Storage.getValue(storageToken);

    var schedule = <String, dynamic>{
      "nama_kegiatan": data["nama_kegiatan"],
      "detail_kegiatan": data["detail_kegiatan"],
      "tanggal": data["tanggal"],
      "tempat": data["tempat"],
      "jam": data["jam"],
      "status": data["status"],
    };

    var response = await http.put(
        Uri.parse(baseURLAPI + "schedules/" + id.toString()),
        body: jsonEncode(schedule),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $token",
        });

    if (response.statusCode == 200) {
      return true;
    } else {
      // throw Exception("Gagal Terhubung ke Server");
      throw Exception(id.toString());
    }
  }

  static Future<bool> deleteSchedule(int id) async {
    final token = Storage.getValue(storageToken);

    var response = await http
        .delete(Uri.parse(baseURLAPI + "schedules/" + id.toString()), headers: {
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
