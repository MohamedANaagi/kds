import 'dart:io';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../Colors/colors.dart';

class DevicesPage extends StatefulWidget {
  const DevicesPage({super.key});

  @override
  State<DevicesPage> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  IO.Socket? socket;
  List<Map<String, String>> connectedCashiers = [];

  @override
  void initState() {
    super.initState();
    _connectToCashiers();
  }

  void _connectToCashiers() {
    socket = IO.io('http://10.0.2.15:41263', <String, dynamic>{  // استبدل 10.0.2.15 بعنوان IP لجهاز KDS
      'transports': ['websocket'],
      'autoConnect': true,
    });

    socket?.on('connect', (_) {
      print('KDS Connected');
    });

    socket?.on('cashier_connected', (data) {
      setState(() {
        if (!connectedCashiers.any((cashier) => cashier['id'] == data['id'])) {
          connectedCashiers.add({
            'id': data['id'],
            'ip': data['ip'],
            'port': data['port'].toString(),
          });
        }
      });
      print("Cashier connected: ${data['id']} with IP ${data['ip']} on Port ${data['port']}");
    });

    // استقبال الرسائل من أجهزة الكاشير
    socket?.on('cashier_message', (data) {
      print("Message from ${data['id']}: ${data['message']}");
      // هنا يمكنك معالجة الرسالة أو عرضها في واجهة المستخدم
    });

    socket?.on('disconnect', (data) {
      setState(() {
        connectedCashiers.removeWhere((cashier) => cashier['id'] == data['id']);
      });
      print("Cashier disconnected: ${data['id']}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        title: Text('Devices Page', style: TextStyle(color: AppColor.TextColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Cashiers',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: connectedCashiers.length,
                itemBuilder: (context, index) {
                  final cashier = connectedCashiers[index];
                  return ListTile(
                    title: Text('ID: ${cashier['id']}'),
                    subtitle: Text('IP: ${cashier['ip']} | Port: ${cashier['port']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
