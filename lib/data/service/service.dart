// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:my_wallet_sqflite/data/model/kirim_chiqim_model/chiqim_model.dart';
import 'package:my_wallet_sqflite/data/model/kirim_chiqim_model/kirim_chiqim_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalDataBases {
  Database? database;
  String tableNameKirim = "kirim";
  String tableNameChiqim = "chiqim";

  LocalDataBases();

  Future<Database> getKirimDb() async {
    if (database == null) {
      database = await createDataBaseKirim();
      return database!;
    }
    return database!;
  }

  Future<Database> getChiqimDb() async {
    if (database == null) {
      database = await createDataBaseChiqim();
      return database!;
    }
    return database!;
  }

  createDataBaseKirim() async {
    String dataBasePath = await getDatabasesPath();
    String path = '${dataBasePath}kirim.db';

    var database =
        await openDatabase(path, version: 1, onCreate: populateKirimDb);

    return database;
  }

  createDataBaseChiqim() async {
    String dataBasePath = await getDatabasesPath();
    String path = '${dataBasePath}chiqim.db';

    var database =
        await openDatabase(path, version: 1, onCreate: populateChiqimDb);
    return database;
  }

  void populateKirimDb(Database db, int version) async {
    await db.execute(
      "CREATE TABLE $tableNameKirim ("
      "id INTEGER PRIMARY KEY AUTOINCREMENT,"
      "narx TEXT,"
      "izoh TEXT,"
      "sana DATE,"
      "vaqt TIME"
      ")",
    );
  }

  void populateChiqimDb(Database db, int version) async {
    await db.execute(
      "CREATE TABLE $tableNameChiqim ("
      "id INTEGER PRIMARY KEY AUTOINCREMENT,"
      "narx TEXT,"
      "izoh TEXT,"
      "sana DATE,"
      "vaqt TIME"
      ")",
    );
  }

//Start CRUD

  // START KIRIM CRUD

  //    KIRIM ADD
  Future addKirim(KirimModel kirimModel) async {
    try {
      Database db = await getKirimDb();
      var id = await db.insert(tableNameKirim, kirimModel.toJson());

      if (kDebugMode) {
        print("Kirim manashu ID bilan qoshildi $id");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error while adding kirim: $e");
      }
      // Handle the error gracefully here, such as showing an error message to the user.
    }
  }

  //    KIRIM GET
  Future<List<KirimModel>> getAllKirim() async {
    try {
      Database db = await getKirimDb();
      List<Map<String, dynamic>> results = await db.query(tableNameKirim);

      List<KirimModel> kirimList = results.map((map) {
        return KirimModel.fromJson(map);
      }).toList();

      return kirimList;
    } catch (e) {
      if (kDebugMode) {
        print("Error while getting all kirim records: $e");
      }
      return [];
    }
  }

//    KIRIM UPDATE
  Future<void> updateKirim(KirimModel kirimModel) async {
    try {
      Database db = await getKirimDb();
      var id = await db.update(
        tableNameKirim,
        {
          'narx': kirimModel.narx,
          'izoh': kirimModel.izoh,
          'sana': kirimModel.sana.toIso8601String(),
          // Convert DateTime to ISO 8601 string
        },
        where: "id = ?",
        whereArgs: [
          kirimModel.id,
        ],
      );

      if (kDebugMode) {
        print(kirimModel.id);
        print("Updated $id row(s)");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error while updating kirim: $e");
      }
      // Handle the error gracefully here, such as showing an error message to the user.
    }
  }

//    KIRIM DELETE
  Future deleteKirim(int id) async {
    Database? db = await getKirimDb();

    db.delete(tableNameKirim, where: "id = ?", whereArgs: [id]);
  }

  // START CHIQIM CRUD

  //    CHIQIM ADD
  Future chiqimAdd(ChiqimModel chiqimModel) async {
    try {
      Database db = await getChiqimDb();
      var id = await db.insert(tableNameChiqim, chiqimModel.toJson());

      if (kDebugMode) {
        print("Chiqim manashu ID bilan qoshildi $id");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error while adding chiqim: $e");
      }
      // Handle the error gracefully here, such as showing an error message to the user.
    }
  }

  //    KIRIM GET
  Future<List<ChiqimModel>> getAllChiqim() async {
    try {
      Database db = await getChiqimDb();
      List<Map<String, dynamic>> results = await db.query(tableNameChiqim);

      List<ChiqimModel> chiqimList = results.map((map) {
        return ChiqimModel.fromJson(map);
      }).toList();

      return chiqimList;
    } catch (e) {
      if (kDebugMode) {
        print("Error while getting all chiqim records: $e");
      }
      return [];
    }
  }

//    KIRIM UPDATE
  Future<void> updateChiqim(ChiqimModel chiqimModel) async {
    try {
      Database db = await getChiqimDb();
      var id = await db.update(
        tableNameChiqim,
        {
          'narx': chiqimModel.narx,
          'izoh': chiqimModel.izoh,
          'sana': chiqimModel.sana.toIso8601String(),
          // Convert DateTime to ISO 8601 string
        },
        where: "id = ?",
        whereArgs: [
          chiqimModel.id,
        ],
      );

      if (kDebugMode) {
        print(chiqimModel.id);
        print("Updated $id row(s)");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error while updating chiqim: $e");
      }
      // Handle the error gracefully here, such as showing an error message to the user.
    }
  }

//    KIRIM DELETE
  Future deletechiqim(int id) async {
    Database? db = await getChiqimDb();

    db.delete(tableNameChiqim, where: "id = ?", whereArgs: [id]);
  }

  Future<Map<String, dynamic>> fetchSummary() async {
    Database dbkirim = await getKirimDb();
    Database dbchiqim = await getChiqimDb();
    Database db = database!;

    var kirimResult = await dbkirim.rawQuery('SELECT SUM(narx) FROM kirim');
    var chiqimResult = await dbchiqim.rawQuery('SELECT SUM(narx) FROM chiqim');
    var jamiResult = await db.rawQuery('''
      SELECT (SELECT SUM(narx) FROM kirim) - (SELECT SUM(narx) FROM chiqim) as jami
  ''');

    Object? kirim = kirimResult.first['kirim'];
    Object? chiqim = chiqimResult.first['chiqim'];
    Object? jami = jamiResult.first['jami'];
    print(kirim);
    print(chiqim);
    print(jami);

    return {'kirim': kirim, 'chiqim': chiqim, 'jami': jami};
  }
}
