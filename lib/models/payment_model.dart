import 'dart:convert';

PaymentDetailsModel paymentsModelFromJson(String str) =>
    PaymentDetailsModel.fromJson(json.decode(str));

String paymentsModelToJson(PaymentDetailsModel data) =>
    json.encode(data.toJson());

class PaymentDetailsModel {
  PaymentDetailsModel({
    required this.data,
  });

  List<PaymentDetailModel> data;

  factory PaymentDetailsModel.fromJson(Map<String, dynamic> json) =>
      PaymentDetailsModel(
        data: List<PaymentDetailModel>.from(
            json["data"].map((x) => PaymentDetailModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class PaymentDetailModel {
  PaymentDetailModel({
    required this.id,
    required this.namaPayment,
    required this.bayar,
    required this.tanggal,
    required this.detail,
    required this.eventId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String namaPayment;
  int bayar;
  DateTime tanggal;
  String detail;
  int eventId;
  DateTime createdAt;
  DateTime updatedAt;

  factory PaymentDetailModel.fromJson(Map<String, dynamic> json) =>
      PaymentDetailModel(
        id: json["id"],
        namaPayment: json["nama_payment"],
        bayar: json["bayar"],
        tanggal: DateTime.parse(json["tanggal"]),
        detail: json["detail"],
        eventId: json["event_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_payment": namaPayment,
        "bayar": bayar,
        "tanggal": tanggal.toIso8601String(),
        "detail": detail,
        "event_id": eventId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}