import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:marriage_story_mobile/constants/string.dart';
import 'package:marriage_story_mobile/models/event_model.dart';
import 'package:marriage_story_mobile/utils/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventService {
  static Future<List<EventDataModel>?> getEvent() async {
    final token = Storage.getValue(storageToken);

    var response = await http.get(
      Uri.parse(baseURLAPI + "events"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer $token",
      },
    );
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body)['data'];
      return jsonResponse.map((e) => EventDataModel.fromJson(e)).toList();
    } else {
      throw jsonDecode(response.body);
    }
  }

  static Future<bool> createEvent(Map<String, dynamic> data) async {
    // final token = prefs.getString("token");
    final token = Storage.getValue(storageToken);
    var event = <String, dynamic>{
      "name_client": data["name_client"],
      "date": data["date"],
      "time": data["time"],
      "tempat": data["tempat"],
      "total_pembayaran": data["total_pembayaran"],
      "status_pembayaran": data["status_pembayaran"],
      "jumlah_terbayar": data["jumlah_terbayar"],
      "note": data["note"],
      "paket": data["paket"],
    };

    var response = await http.post(Uri.parse(baseURLAPI + "events"),
        body: jsonEncode(event),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': "Bearer $token",
        });

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Gagal Terhubung ke Server");
    }
  }

  static Future<bool> updateEvent(int id, Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString("token");
    final token = Storage.getValue(storageToken);

    var event = <String, dynamic>{
      "name_client": data["name_client"],
      "date": data["date"],
      "time": data["time"],
      "tempat": data["tempat"],
      "total_pembayaran": data["total_pembayaran"],
      "status_pembayaran": data["status_pembayaran"],
      "jumlah_terbayar": data["jumlah_terbayar"],
      "note": data["note"],
      "paket": data["paket"],
    };

    var response = await http.put(
        Uri.parse(baseURLAPI + "events/" + id.toString()),
        body: jsonEncode(event),
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

  static Future<bool> deleteEvent(int id) async {
    final prefs = await SharedPreferences.getInstance();
    // final token = prefs.getString("token");
    final token = Storage.getValue(storageToken);

    var response = await http
        .delete(Uri.parse(baseURLAPI + "events/" + id.toString()), headers: {
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
