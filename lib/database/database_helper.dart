import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/history_model.dart';


class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'orders_database.db');
    return await openDatabase(
      path,
      version: 2, // زيادة النسخة
      onCreate: (db, version) async {
        await _createTables(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await _createTables(db); // إنشاء الجدول إذا لم يكن موجودًا
        }
      },
    );
  }

  Future<void> _createTables(Database db) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS history_orders(
        id INTEGER PRIMARY KEY,
        serial TEXT,
        type INTEGER,
        createdAt TEXT,
        orders TEXT
      )
    ''');
  }

  Future<void> insertHistoryOrder(HistoryModel order) async {
    try {
      final db = await database;
      await db.insert(
        'history_orders',
        order.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print("Error saving order to database: $e");
    }
  }

  Future<List<HistoryModel>> getHistoryOrders() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('history_orders');

    return List.generate(maps.length, (i) {
      return HistoryModel.fromMap(maps[i]);
    });
  }
}

Future<void> initializeDatabase() async {
  final dbHelper = DatabaseHelper();
  await dbHelper.database; // تأكد من إنشاء قاعدة البيانات
}

/////////////////////////////////


