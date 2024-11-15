import 'package:flutter/material.dart';

import '../utlis/constant/Colors/colors.dart';



class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool showPreparationTime = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.mainColor,
        title: Text('Settings Page',style:TextStyle(color: AppColor.TextColor) ,),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [

          ListTile(
            title: Text('Menu Language'),
            trailing: Text('Main'),
            onTap: () {
            },
          ),
          Divider(),
          // Number of Rows
          ListTile(
            title: Text('Number Of rows'),
            trailing: Text('1'),
            onTap: () {
            },
          ),
          Divider(),

          // Number of Columns
          ListTile(
            title: Text('Number Of columns'),
            trailing: Text('4'),
            onTap: () {
            },
          ),
          Divider(),

          SwitchListTile(
            title: Text('Show Item Preparation Time'),
            value: showPreparationTime,
            onChanged: (bool value) {
              setState(() {
                showPreparationTime = value;
              });
            },
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
