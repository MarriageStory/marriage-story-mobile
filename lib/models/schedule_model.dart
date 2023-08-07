// To parse required this JSON data, do
//
//     final scheduleModel = scheduleModelFromJson(jsonString);

import 'dart:convert';

ScheduleModel scheduleModelFromJson(String str) => ScheduleModel.fromJson(json.decode(str));

String scheduleModelToJson(ScheduleModel data) => json.encode(data.toJson());

class ScheduleModel {
    ScheduleModel({
        required this.status,
        required this.message,
        required this.data,
    });

    bool status;
    String message;
    List<ScheduleDataModel> data;

    factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
        status: json["status"],
        message: json["message"],
        data: List<ScheduleDataModel>.from(json["data"].map((x) => ScheduleDataModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class ScheduleDataModel {
    ScheduleDataModel({
        required this.id,
        required this.namaKegiatan,
        required this.detailKegiatan,
        required this.datetime,
        required this.tempat,
        required this.eventId,
        required this.createdAt,
        required this.updatedAt,
        required this.event,
    });

    int id;
    String namaKegiatan;
    String detailKegiatan;
    DateTime datetime;
    String tempat;
    int eventId;
    DateTime createdAt;
    DateTime updatedAt;
    Event event;

    factory ScheduleDataModel.fromJson(Map<String, dynamic> json) => ScheduleDataModel(
        id: json["id"],
        namaKegiatan: json["nama_kegiatan"],
        detailKegiatan: json["detail_kegiatan"],
        datetime: DateTime.parse(json["datetime"]),
        tempat: json["tempat"],
        eventId: json["event_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        event: Event.fromJson(json["event"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_kegiatan": namaKegiatan,
        "detail_kegiatan": detailKegiatan,
        "datetime": datetime.toIso8601String(),
        "tempat": tempat,
        "event_id": eventId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "event": event.toJson(),
    };
}

class Event {
    Event({
        required this.id,
        required this.namaClient,
        required this.datetime,
        required this.tempat,
        required this.totalPembayaran,
        required this.statusPembayaran,
        required this.jumlahTerbayar,
        required this.note,
        required this.gencode,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String namaClient;
    DateTime datetime;
    String tempat;
    int totalPembayaran;
    String statusPembayaran;
    int jumlahTerbayar;
    String note;
    String gencode;
    DateTime createdAt;
    DateTime updatedAt;

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        namaClient: json["nama_client"],
        datetime: DateTime.parse(json["datetime"]),
        tempat: json["tempat"],
        totalPembayaran: json["total_pembayaran"],
        statusPembayaran: json["status_pembayaran"],
        jumlahTerbayar: json["jumlah_terbayar"],
        note: json["note"],
        gencode: json["gencode"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_client": namaClient,
        "datetime": datetime.toIso8601String(),
        "tempat": tempat,
        "total_pembayaran": totalPembayaran,
        "status_pembayaran": statusPembayaran,
        "jumlah_terbayar": jumlahTerbayar,
        "note": note,
        "gencode": gencode,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
