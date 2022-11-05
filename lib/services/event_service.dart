import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marriage_story_mobile/constants/string.dart';
import 'package:marriage_story_mobile/models/event_model.dart';
import 'package:marriage_story_mobile/utils/storage.dart';

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
}
