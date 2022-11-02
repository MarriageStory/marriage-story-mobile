import 'dart:convert';

SchedulesModel schedulesModelFromJson(String str) =>
    SchedulesModel.fromJson(json.decode(str));

String schedulesModelToJson(SchedulesModel data) => json.encode(data.toJson());

class SchedulesModel {
  SchedulesModel({
    required this.data,
  });

  List<ScheduleModel> data;

  factory SchedulesModel.fromJson(Map<String, dynamic> json) => SchedulesModel(
        data: List<ScheduleModel>.from(
            json["data"].map((x) => ScheduleModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ScheduleModel {
  ScheduleModel({
    required this.id,
    required this.namaKegiatan,
    required this.detailKegiatan,
    required this.tanggal,
    required this.tempat,
    required this.jam,
    required this.status,
    required this.gencode,
    required this.eventId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String namaKegiatan;
  String detailKegiatan;
  DateTime tanggal;
  String tempat;
  String jam;
  String status;
  String gencode;
  int eventId;
  DateTime createdAt;
  DateTime updatedAt;

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
        id: json["id"],
        namaKegiatan: json["nama_kegiatan"],
        detailKegiatan: json["detail_kegiatan"],
        tanggal: DateTime.parse(json["tanggal"]),
        tempat: json["tempat"],
        jam: json["jam"],
        status: json["status"],
        gencode: json["gencode"],
        eventId: json["event_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_kegiatan": namaKegiatan,
        "detail_kegiatan": detailKegiatan,
        "tanggal": tanggal.toIso8601String(),
        "tempat": tempat,
        "jam": jam,
        "status": status,
        "gencode": gencode,
        "event_id": eventId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}