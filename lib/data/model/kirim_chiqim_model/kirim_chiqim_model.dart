import 'package:json_annotation/json_annotation.dart';


class KirimModel {
  int? id;
  String? narx;
  String? izoh;
  DateTime sana;

  KirimModel({
     this.id,
    required this.narx,
    required this.izoh,
    required this.sana,
  });

  factory KirimModel.fromJson(Map<String, dynamic> json) {
    return KirimModel(
      id: json["id"],
      narx: json["narx"],
      izoh: json["izoh"],
      sana: DateTime.parse(json['sana']),
    );
  }

  toJson() {
    return {
      "id": id,
      "narx": narx,
      "izoh": izoh,
      "sana": sana.toIso8601String(),
    };
  }
}
