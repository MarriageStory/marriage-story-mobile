// To parse this JSON data, do
//
//     final eventsModel = eventsModelFromJson(jsonString);

import 'dart:convert';

EventsModel eventsModelFromJson(String str) =>
    EventsModel.fromJson(json.decode(str));

String eventsModelToJson(EventsModel data) => json.encode(data.toJson());

class EventsModel {
  EventsModel({
    required this.data,
  });

  List<EventDataModel> data;

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
        data: List<EventDataModel>.from(
            json["data"].map((x) => EventDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class EventDataModel {
  EventDataModel({
    required this.id,
    required this.nameClient,
    required this.date,
    required this.time,
    required this.tempat,
    required this.totalPembayaran,
    required this.statusPembayaran,
    required this.jumlahTerbayar,
    required this.note,
    required this.paket1,
    required this.paket2,
    required this.paket3,
    required this.paket4,
    required this.paket5,
    required this.gencode,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String nameClient;
  DateTime date;
  String time;
  String tempat;
  int totalPembayaran;
  String statusPembayaran;
  String jumlahTerbayar;
  String note;
  String paket1;
  String paket2;
  String paket3;
  String paket4;
  String paket5;
  String gencode;
  DateTime createdAt;
  DateTime updatedAt;

  factory EventDataModel.fromJson(Map<String, dynamic> json) => EventDataModel(
        id: json["id"],
        nameClient: json["name_client"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        tempat: json["tempat"],
        totalPembayaran: json["total_pembayaran"],
        statusPembayaran: json["status_pembayaran"],
        jumlahTerbayar: json["jumlah_terbayar"],
        note: json["note"],
        paket1: json["paket1"],
        paket2: json["paket2"],
        paket3: json["paket3"],
        paket4: json["paket4"],
        paket5: json["paket5"],
        gencode: json["gencode"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_client": nameClient,
        "date": date.toIso8601String(),
        "time": time,
        "tempat": tempat,
        "total_pembayaran": totalPembayaran,
        "status_pembayaran": statusPembayaran,
        "jumlah_terbayar": jumlahTerbayar,
        "note": note,
        "paket1": paket1,
        "paket2": paket2,
        "paket3": paket3,
        "paket4": paket4,
        "paket5": paket5,
        "gencode": gencode,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
