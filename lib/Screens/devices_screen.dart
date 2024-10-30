import 'package:flutter/material.dart';

import '../Colors/colors.dart';

class DevicesPage extends StatelessWidget {
  const DevicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,

        title: Text('Devices Page',style:TextStyle(color: AppColor.TextColor) ,),
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
              child: ListView(
                children: [
                  // Cashier 1
                  buildCashierTile(
                      context,
                      'Cashier 1',
                      '192.168.1.48',
                      isOnline: true
                  ),
                  Divider(),

                  // Cashier 2
                  buildCashierTile(
                      context,
                      'Cashier 2',
                      '192.168.1.49',
                      isOnline: false
                  ),
                  Divider(),

                  // Cashier 3
                  buildCashierTile(
                      context,
                      'Cashier 3',
                      '192.168.1.50',
                      isOnline: true
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget buildCashierTile(BuildContext context, String cashierName, String ipAddress, {required bool isOnline}) {
    return ListTile(
      title: Text(
        '$cashierName  ($ipAddress)',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // زر Online أو Offline
          ElevatedButton(
            onPressed: () {

            },
            style: ElevatedButton.styleFrom(

              backgroundColor: AppColor.secondaryColor,
            ),
            child: Text(isOnline ? 'Online' : 'Offline'),
          ),
          SizedBox(width: 8),

          // زر Ping
          OutlinedButton(
            onPressed: () {
              // وظيفة Ping
            },
            child: Text('Ping'),
          ),
        ],
      ),
    );
  }
}
