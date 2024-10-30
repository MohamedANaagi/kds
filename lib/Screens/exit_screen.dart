import 'package:flutter/material.dart';

class ExitPage extends StatelessWidget {
  const ExitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exit Page'),
      ),
      body: Center(
        child: Text('This is the Exit Page'),
      ),
    );
  }
}
