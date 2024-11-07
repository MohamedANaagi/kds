import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Screens/Login/login_screen.dart';
import 'Screens/main_screen.dart';
import 'Widgets/provider.dart';
import 'cubit/order_selection_cubit.dart';
import 'database/database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDatabase();
  // final dbHelper = DatabaseHelper();
  // await dbHelper.clearDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderSelectionCubit(), // Providing the cubit here
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ActivationPage(),
      ),
    );
  }
}
