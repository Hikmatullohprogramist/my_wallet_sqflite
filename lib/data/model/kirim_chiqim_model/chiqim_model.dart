

class ChiqimModel {
  int? id;
  String? narx;
  String? izoh;
  DateTime sana;

  ChiqimModel({
    this.id,
    required this.narx,
    required this.izoh,
    required this.sana,
  });

  factory ChiqimModel.fromJson(Map<String, dynamic> json) {
    return ChiqimModel(
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
