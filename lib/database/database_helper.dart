import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:cashier_app/features/history_feature/data/models/history_model.dart';
import 'dart:convert';

import '../features/order_body/data/models/orders.dart';

class DatabaseHelper {
  Future<void> clearDatabase() async {
    try {
      final db = await database;
      // حذف جميع البيانات من جدول history_orders
      await db.delete('history_orders');
      print("All data cleared from history_orders table.");
    } catch (e) {
      print("Error clearing data from database: $e");
    }
  }
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;
  final _orderStreamController = StreamController<List<HistoryModel>>.broadcast();

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
      version: 2,
      onCreate: (db, version) async {
        await _createTables(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await _createTables(db);
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
  Future<void> insertAll(List<OrderModel> orders) async {
    try {
      final db = await database;
      Batch batch = db.batch();
      for (var order in orders) {
        final historyOrder = HistoryModel(
          id: order.id,
          serial: order.serial,
          type: order.type,
          createdAt: order.createdAt.toIso8601String(),
          orders: order.orders,
        );

        batch.insert(
          'history_orders',
          {
            ...historyOrder.toMap(),
            'orders': jsonEncode(historyOrder.orders.map((item) => item.toMap()).toList()),
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      final updatedOrders = await getHistoryOrders();
      _orderStreamController.add(updatedOrders); // إرسال البيانات الجديدة

      await batch.commit(noResult: true);
      print("All orders inserted successfully.");
    } catch (e) {
      print("Error inserting all orders: $e");
    }
  }

  Future<void> insertHistoryOrder(HistoryModel order) async {
    try {
      final db = await database;
      await db.insert(
        'history_orders',
        {
          ...order.toMap(),
          'orders': jsonEncode(order.orders.map((item) => item.toMap()).toList()) // Save orders as JSON string
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      final updatedOrders = await getHistoryOrders();
      _orderStreamController.add(updatedOrders); // إرسال البيانات الجديدة

    } catch (e) {
      print("Error saving order to database: $e");
    }
  }

  Future<List<HistoryModel>> getHistoryOrders() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('history_orders');

    return List.generate(maps.length, (i) {
      return HistoryModel(
        id: maps[i]['id'],
        serial: maps[i]['serial'],
        type: maps[i]['type'],
        createdAt: maps[i]['createdAt'],
        orders: (jsonDecode(maps[i]['orders']) as List<dynamic>)
            .map((item) => OrderItemModel.fromMap(item))
            .toList(),
      );
    });
  }
  Stream<List<HistoryModel>> get orderStream => _orderStreamController.stream; // توفير stream للـ UI للاستماع للتحديثات

}


Future<void> initializeDatabase() async {
  final dbHelper = DatabaseHelper();
  await dbHelper.database;
}