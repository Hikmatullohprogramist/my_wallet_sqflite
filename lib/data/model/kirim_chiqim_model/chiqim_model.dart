import 'package:json_annotation/json_annotation.dart';


class ChiqimModel {
  int id;
  int? userId;
  String? narx;
  String izoh;
  DateTime sana;

  ChiqimModel({
    required this.id,
    required this.userId,
    required this.narx,
    required this.izoh,
    required this.sana,
  });

  factory ChiqimModel.fromJson(Map<String, dynamic> json) {
    return ChiqimModel(
      id: json["id"],
      userId: json["userId"],
      narx: json["narx"],
      izoh: json["izoh"],
      sana: json["sana"],
    );
  }

  toJson() {
    return {
      "id": id,
      "userId": userId,
      "narx": narx,
      "izoh": izoh,
      "sana": sana,
    };
  }
}
