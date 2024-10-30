import 'package:flutter/material.dart';

import '../Colors/colors.dart';

class DiagnosticsPage extends StatelessWidget {
  const DiagnosticsPage({super.key});

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
      body: Column(
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
                      padding: EdgeInsets.symmetric(vertical: 25), // حذف horizontal لتوزيع العرض بالتساوي
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
                SizedBox(width: 20), // المسافة بين الأزرار
                // زر Send Diagnostics
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.x,
                      padding: EdgeInsets.symmetric(vertical: 25), // فقط التحكم في الارتفاع
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
                // Internet Status
                ListTile(
                  title: Text('Internet Status'),
                  trailing: Text(
                    'Connected',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                Divider(),

                // IP Address
                ListTile(
                  title: Text('IP Address'),
                  trailing: Text(
                    '192.168.1.53',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Divider(),

                // Business Name
                ListTile(
                  title: Text('Business Name'),
                  trailing: Text('Almedhal Restaurant (289395)'),
                ),
                Divider(),

                // Branch Name
                ListTile(
                  title: Text('Branch Name'),
                  trailing: Text('الفرع الرئيسي (B01)'),
                ),
                Divider(),

                // Device Name
                ListTile(
                  title: Text('Device Name'),
                  trailing: Text('KDS 1 (K02)'),
                ),
                Divider(),

                // Application Version
                ListTile(
                  title: Text('Application Version'),
                  trailing: Text('5.0.8 (51)'),
                ),
                Divider(),

                // System Version
                ListTile(
                  title: Text('System Version'),
                  trailing: Text('iOS 15.7'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
