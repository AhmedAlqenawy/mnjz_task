import 'dart:async';
import 'dart:io' as io;

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class CacheService {
  String responseTable = 'responses';
  String favoritesTable = 'favorite_supplications';

  String bookMarks = 'book_marks';
  String favoriteAya = 'favorite_aya';
  String ayaNotes = 'aya_note';
  String trackerPrayersTable = 'tracker_prayer';
  String trackerFastingTable = 'tracker_fasting';
  String kidsTable = 'kids';
  String favoritesStoriesTable = 'favorite_stories';
  String favoritesBehaviorsTable = 'favorite_behaviors';

  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDB();
      return _db;
    } else {
      return _db;
    }
  }

  initialDB() async {
    io.Directory docDirect = await getApplicationDocumentsDirectory();
    String path = join(docDirect.path, 'sondos_database.db');
    var myDb = await openDatabase(path, version: 6,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE IF NOT EXISTS "$responseTable" ("endPoint" Text  NOT NULL,"url" Text , "response" Text ,"timeStamp" Text, "language" Text)');

      await db.execute(
          'CREATE TABLE IF NOT EXISTS "$favoritesTable" ("id" INTEGER,"title" Text , "title_ar" Text , "image" Text ,"duaa" Text, "duaa_ar" Text, "description" Text, "description_ar" Text, "sound" Text,"kid_id" INTEGER)');

      await db.execute(
          'CREATE TABLE IF NOT EXISTS "$bookMarks" ("id" INTEGER PRIMARY KEY AUTOINCREMENT,"suraInd" Text ,"suraName" Text ,"aya" Text )');
      await db.execute(
          'CREATE TABLE IF NOT EXISTS "$favoriteAya" ("id" INTEGER PRIMARY KEY AUTOINCREMENT,"suraInd" Text ,"suraName" Text ,"ayaInd" Text )');
      await db.execute(
          'CREATE TABLE IF NOT EXISTS "$ayaNotes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT,"suraInd" Text ,"note" Text ,"ayaInd" Text )');
      await db.execute(
          'CREATE TABLE IF NOT EXISTS "$trackerPrayersTable" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"time" Text ,"date" Text,"kid_id" INTEGER)');
      await db.execute(
          'CREATE TABLE IF NOT EXISTS "$trackerFastingTable" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"note" Text ,"date" Text,"month_name" Text,"month" Text,"year" Text,"day" Text,"status" Text,"kid_id" INTEGER)');
      await db.execute(
          'CREATE TABLE IF NOT EXISTS "$kidsTable" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"Kid_name" Text )');
      await db.execute(
          'CREATE TABLE IF NOT EXISTS "$favoritesStoriesTable" ("id" INTEGER,"story" Text,"kid_id" INTEGER)');
      await db.execute(
          'CREATE TABLE IF NOT EXISTS "$favoritesBehaviorsTable" ("id" INTEGER,"behavior" Text,"kid_id" INTEGER)');
    }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
      if (oldVersion == 6) {}
    });
    return myDb;
  }

  Future<bool> addResponse({
    required String endPoint,
    required String response,
    required String url,
    required String time,
  }) async {
    Database? database = await db;
    List ret = await database!
        .rawQuery('SELECT * FROM $responseTable where endPoint = "$endPoint" ');
    // print(ret.length.toString());
    if (ret.isNotEmpty) {
      updateData(
          endPoint: endPoint, response: response, timeStamp: time, url: url);
      return true;
    } else {
      await insertDatabase(
          endPoint: endPoint, response: response, time: time, url: url);
      return true;
    }
  }

  insertDatabase({
    required String endPoint,
    required String response,
    required String time,
    required String url,
  }) async {
    Database? database = await db;
    await database!
        .rawInsert(
            "INSERT INTO $responseTable(endPoint,url,response,timeStamp) VALUES('$endPoint','$url','$response','$time')")
        //  .then((value) => print('$value inserted successfully ')
        .catchError((e) {
      if (kDebugMode) {
        print('Error When Inserting New Record ${e.toString()}');
      }
      return 0;
    });
  }

  void updateData({
    required String endPoint,
    required String response,
    required String timeStamp,
    required String url,
  }) async {
    Database? database = await db;
    database!.rawUpdate(
        'UPDATE $responseTable SET response = ?,url=?,timeStamp=? WHERE endPoint = ?',
        [response, url, timeStamp, endPoint]).then((value) {
      //getDataFromDatabase(database);
    });
  }

  getEndPointCache(String endPoint) async {
    Database? db1 = await db;
    List ret = await db1!
        .rawQuery("SELECT * FROM $responseTable where endPoint = '$endPoint' ");
    if (ret.isNotEmpty) {
      return ret[0]['response'];
    } else {
      return "";
    }
  }

  Future<int> deleteData({required String endPoint}) async {
    Database? database = await db;
    return database!
        .rawDelete('DELETE FROM $responseTable where endPoint = ?', [endPoint]);
  }

  Future<void> deleteTable() async {
    Database? database = await db;
    await database!.execute("DELETE FROM $responseTable");
  }
}
