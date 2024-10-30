
import 'package:cashier_app/Screens/settings_screen.dart';
import 'package:flutter/material.dart';
import '../Colors/colors.dart';
import 'Login/login_screen.dart';
import 'devices_screen.dart';
import 'diagnostics_screen.dart';
import 'exit_screen.dart';


class ManageScreen extends StatelessWidget {
  const ManageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,

        title: Text('Manage Page',style:TextStyle(color: AppColor.TextColor) ,),
      ),
      body: Row(
        children: [

          Container(
            width: 250,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                  ),
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: AppColor.TextColor,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.devices, color: Colors.blueAccent),
                  title: Text('Devices', style: TextStyle(fontSize: 16)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DevicesPage()),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.analytics, color: Colors.deepPurple),
                  title: Text('Diagnostics', style: TextStyle(fontSize: 16)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DiagnosticsPage()),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.teal),
                  title: Text('Settings', style: TextStyle(fontSize: 16)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SettingsPage()),
                    );
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.exit_to_app, color: Colors.redAccent),
                  title: Text('Exit', style: TextStyle(fontSize: 16)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  ActivationPage()),
                    );
                  },
                ),
              ],
            ),
          ),


          Expanded(
            child: Center(
              child: Text(
                'Welcome to the Manage Page!',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:kds2/Colors/colors.dart';
// import 'devices_page.dart';
// import 'diagnostics_page.dart';
// import 'settings_page.dart';
// import 'exit_page.dart';
//
// class ManageScreen extends StatelessWidget {
//   const ManageScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Manage Page'),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: AppColor.mainColor,
//               ),
//               child: Text(
//                 'Menu',
//                 style: TextStyle(
//                   color: AppColor.TextColor,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.devices, color: Colors.blueAccent),
//               title: Text('Devices', style: TextStyle(fontSize: 16)),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const DevicesPage()),
//                 );
//               },
//             ),
//             Divider(),
//             ListTile(
//               leading: Icon(Icons.analytics, color: Colors.deepPurple),
//               title: Text('Diagnostics', style: TextStyle(fontSize: 16)),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const DiagnosticsPage()),
//                 );
//               },
//             ),
//             Divider(),
//             ListTile(
//               leading: Icon(Icons.settings, color: Colors.teal),
//               title: Text('Settings', style: TextStyle(fontSize: 16)),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const SettingsPage()),
//                 );
//               },
//             ),
//             Divider(),
//             ListTile(
//               leading: Icon(Icons.exit_to_app, color: Colors.redAccent),
//               title: Text('Exit', style: TextStyle(fontSize: 16)),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const ExitPage()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Center(
//         child: Text('Welcome to the Manage Page!'),
//       ),
//     );
//   }
// },
//
