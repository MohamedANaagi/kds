import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';

import '../utlis/constant/Colors/colors.dart';


class DiagnosticsPage extends StatelessWidget {
  const DiagnosticsPage({super.key});

  Future<Map<String, dynamic>> _getDeviceData() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final connectivity = Connectivity();

    Map<String, dynamic> deviceData = {
      'Internet Status': 'Checking...', // حالة افتراضية مؤقتة
      'IP Address': '192.168.1.53', // يمكن جلبها من خلال مكتبة أخرى أو حزمة IP address
      'Business Name': 'Almedhal Restaurant (289395)', // ثابتة
    };

    // جلب حالة الإنترنت
    var connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      deviceData['Internet Status'] = 'Not Connected';
    } else {
      deviceData['Internet Status'] = 'Connected';
    }

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      deviceData['Device Name'] = androidInfo.model ?? 'Unknown';
      deviceData['Application Version'] = '5.0.8 (51)'; // يمكن تعديلها حسب الحاجة
      deviceData['System Version'] = 'Android ${androidInfo.version.release}';
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      deviceData['Device Name'] = iosInfo.name ?? 'Unknown';
      deviceData['Application Version'] = '5.0.8 (51)'; // يمكن تعديلها حسب الحاجة
      deviceData['System Version'] = 'iOS ${iosInfo.systemVersion}';
    }

    return deviceData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        title: Text(
          'Diagnostics Page',
          style: TextStyle(color: AppColor.TextColor),
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _getDeviceData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data'));
          } else {
            final data = snapshot.data!;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.x,
                            padding: EdgeInsets.symmetric(vertical: 25),
                          ),
                          child: Text(
                            'Download Data',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.x,
                            padding: EdgeInsets.symmetric(vertical: 25),
                          ),
                          child: Text(
                            'Send Diagnostics',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(16.0),
                    children: [
                      ListTile(
                        title: Text('Internet Status'),
                        trailing: Text(
                          data['Internet Status'],
                          style: TextStyle(
                            color: data['Internet Status'] == 'Connected'
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('IP Address'),
                        trailing: Text(
                          data['IP Address'],
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Business Name'),
                        trailing: Text(data['Business Name']),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Device Name'),
                        trailing: Text(data['Device Name']),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Application Version'),
                        trailing: Text(data['Application Version']),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('System Version'),
                        trailing: Text(data['System Version']),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
