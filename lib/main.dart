import 'package:flutter/material.dart';

import 'Screens/Login/login_screen.dart';
import 'Screens/main_screen.dart';





void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home:ActivationPage (),
    );
  }
}

