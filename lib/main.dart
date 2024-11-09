import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Screens/Login/login_screen.dart';
import 'cubit/order_history_cubit.dart';
import 'cubit/order_selection_cubit.dart';
import 'database/database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OrderSelectionCubit()),
        BlocProvider(create: (context) => OrderHistoryCubit(DatabaseHelper())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ActivationPage(),
      ),
    );
  }
}