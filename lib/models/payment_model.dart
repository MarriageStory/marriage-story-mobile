// To parse required this JSON data, do
//
//     final paymentModel = paymentModelFromJson(jsonString);

import 'dart:convert';

PaymentModel paymentModelFromJson(String str) => PaymentModel.fromJson(json.decode(str));

String paymentModelToJson(PaymentModel data) => json.encode(data.toJson());

class PaymentModel {
    PaymentModel({
        required this.status,
        required this.message,
        required this.data,
    });

    bool status;
    String message;
    List<PaymentDataModel> data;

    factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        status: json["status"],
        message: json["message"],
        data: List<PaymentDataModel>.from(json["data"].map((x) => PaymentDataModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class  PaymentDataModel {
    PaymentDataModel({
        required this.id,
        required this.namaPayment,
        required this.total,
        required this.datetime,
        required this.detail,
        required this.image,
        required this.eventId,
        required this.createdAt,
        required this.updatedAt,
        required this.event,
    });

    int id;
    String namaPayment;
    int total;
    DateTime datetime;
    String detail;
    dynamic image;
    int eventId;
    DateTime createdAt;
    DateTime updatedAt;
    Event event;

    factory PaymentDataModel.fromJson(Map<String, dynamic> json) => PaymentDataModel(
        id: json["id"],
        namaPayment: json["nama_payment"],
        total: json["total"],
        datetime: DateTime.parse(json["datetime"]),
        detail: json["detail"],
        image: json["image"],
        eventId: json["event_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        event: Event.fromJson(json["event"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_payment": namaPayment,
        "total": total,
        "datetime": datetime.toIso8601String(),
        "detail": detail,
        "image": image,
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
