// To parse required this JSON data, do
//
//     final eventsModel = eventsModelFromJson(jsonString);

import 'dart:convert';

EventsModel eventsModelFromJson(String str) => EventsModel.fromJson(json.decode(str));

String eventsModelToJson(EventsModel data) => json.encode(data.toJson());

class EventsModel {
    EventsModel({
        required this.status,
        required this.message,
        required this.data,
    });

    bool status;
    String message;
    List<EventDataModel> data;

    factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
        status: json["status"],
        message: json["message"],
        data: List<EventDataModel>.from(json["data"].map((x) => EventDataModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class EventDataModel {
    EventDataModel({
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
        required this.paket,
        required this.paymentDetails,
        required this.schedules,
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
    List<Paket> paket;
    List<dynamic> paymentDetails;
    List<dynamic> schedules;

    factory EventDataModel.fromJson(Map<String, dynamic> json) => EventDataModel(
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
        paket: List<Paket>.from(json["paket"].map((x) => Paket.fromJson(x))),
        paymentDetails: List<dynamic>.from(json["payment_details"].map((x) => x)),
        schedules: List<dynamic>.from(json["schedules"].map((x) => x)),
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
        "paket": List<dynamic>.from(paket.map((x) => x.toJson())),
        "payment_details": List<dynamic>.from(paymentDetails.map((x) => x)),
        "schedules": List<dynamic>.from(schedules.map((x) => x)),
    };
}

class Paket {
    Paket({
        required this.id,
        required this.eventId,
        required this.deskripsi,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    int eventId;
    String deskripsi;
    DateTime createdAt;
    DateTime updatedAt;

    factory Paket.fromJson(Map<String, dynamic> json) => Paket(
        id: json["id"],
        eventId: json["event_id"],
        deskripsi: json["deskripsi"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "event_id": eventId,
        "deskripsi": deskripsi,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
