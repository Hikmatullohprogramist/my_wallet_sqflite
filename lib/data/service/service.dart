// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:flutter/foundation.dart';
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
      print("Kirim manashu ID bilan qoshildi $id");
    } catch (e) {
      print("Error while adding kirim: $e");
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
      print("Error while getting all kirim records: $e");
      return [];
    }
  }

//    KIRIM DELETE
  Future deleteKirim(int id) async {
    Database? db = await getKirimDb();

    db.delete(tableNameKirim, where: "id = ?", whereArgs: [id]);
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
      print("Error while updating kirim: $e");
      // Handle the error gracefully here, such as showing an error message to the user.
    }
  }
}
