import 'package:cashier_app/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/order_body/presentation/widgets/order_services.dart';

class DevicesPage extends StatefulWidget {
  @override
  State<DevicesPage> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  List<String> cashierIps = [];
  Map<String, bool> cashierStatus = {};
  final TextEditingController ipController = TextEditingController();
  final OrderService orderService = OrderService();

  @override
  void initState() {
    super.initState();
    loadCashierIps();
  }

  Future<void> loadCashierIps() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      cashierIps = prefs.getStringList('cashierIps') ?? [];
    });
    checkAllCashierStatuses();
  }

  Future<void> saveCashierIps() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('cashierIps', cashierIps);
  }

  Future<void> checkAllCashierStatuses() async {
    for (String ip in cashierIps) {
      await _checkIpStatus(ip);
    }
  }

  Future<void> _checkIpStatus(String ip) async {
    try {
      final response = await Dio().get('http://$ip:8080/status');
      setState(() {
        cashierStatus[ip] = response.statusCode == 200;
      });
    } catch (e) {
      setState(() {
        cashierStatus[ip] = false;
      });
    }
  }

  void addCashier() async {
    String newIp = ipController.text.trim();
    if (newIp.isNotEmpty && !cashierIps.contains(newIp)) {
      setState(() {
        cashierIps.add(newIp);
        cashierStatus[newIp] = false;
      });
      await saveCashierIps();
      await orderService.addCashierIp(newIp);
      ipController.clear();
      _checkIpStatus(newIp); // Check status immediately
    }
  }

  void clearAllCashiers() {
    setState(() {
      cashierIps.clear();
      cashierStatus.clear();
    });
    saveCashierIps();
    orderService.clearAllCashierIps();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Devices',
            style: TextStyle(color: AppColor.TextColor),
          ),
          backgroundColor: AppColor.x,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColor.TextColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cashiers',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.x,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: ipController,
                decoration: InputDecoration(
                  labelText: 'Enter Cashier IP',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: addCashier,
                child: Text('Add Cashier'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: clearAllCashiers,
                child: Text('Clear All Cashiers'),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: cashierIps.length,
                  itemBuilder: (context, index) {
                    String ip = cashierIps[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        title: Text(
                          'Cashier ($ip)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: cashierStatus[ip] == true ? Colors.green : Colors.white,
                              ),
                              child: Text('Online'),
                            ),
                            SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: cashierStatus[ip] == true ? Colors.white : Colors.red,
                              ),
                              child: Text('Ping'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
