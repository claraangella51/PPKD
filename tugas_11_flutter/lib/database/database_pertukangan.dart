import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tugas_11_flutter/model/model_pesanan.dart';

class DBHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), "pemesanan.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE pemesanan(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            namaPelanggan TEXT,
            noHp TEXT,
            alamat TEXT,
            jenisLayanan TEXT,
            keluhan TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertPemesanan(PemesananModel pemesanan) async {
    final db = await database;
    return await db.insert("pemesanan", pemesanan.toMap());
  }

  Future<List<PemesananModel>> getAllPemesanan() async {
    final db = await database;
    final res = await db.query("pemesanan");
    return res.map((e) => PemesananModel.fromMap(e)).toList();
  }
}
