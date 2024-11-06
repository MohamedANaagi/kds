import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../models/history_model.dart';


class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<HistoryModel> historyOrders = [];
  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    loadHistoryOrders();
  }

  Future<void> loadHistoryOrders() async {
    final orders = await dbHelper.getHistoryOrders();
    setState(() {
      historyOrders = orders;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Order History")),
      body: ListView.builder(
        itemCount: historyOrders.length,
        itemBuilder: (context, index) {
          final order = historyOrders[index];
          return ListTile(
            title: Text("Order ${order.serial} - ${order.createdAt}"),
            subtitle: Text("Type: ${order.type}"),
          );
        },
      ),
    );
  }
}
