import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'Screens/Login/login_screen.dart';
import 'Screens/main_screen.dart';
import 'Widgets/provider.dart';





void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ValueProvider()),
      ],
      child: MyApp(),
    ),
  );
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

