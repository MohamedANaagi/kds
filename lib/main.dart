import 'package:cashier_app/features/history_feature/data/datasource/order_local_datasource.dart';
import 'package:cashier_app/features/history_feature/data/repositories/order_repo_impl.dart';
import 'package:cashier_app/features/history_feature/domain/repositories/order_repository.dart';
import 'package:cashier_app/features/history_feature/presentation/cubit/order_history_cubit.dart';
import 'package:cashier_app/features/order_body/data/models/orders.dart';
import 'package:cashier_app/features/summary/presentaion/cubit/all_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Screens/Login/login_screen.dart';
import 'database/database_helper.dart';
import 'features/history_feature/presentation/cubit/order_selection_cubit.dart';
import 'features/history_feature/domain/usecase/get_order_history.dart';
import 'features/history_feature/domain/usecase/clear_order_history.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // تهيئة قاعدة البيانات
  await initializeDatabase();
  final database = DatabaseHelper();
  final orderLocalDataSource = OrderLocalDataSource(databaseHelper: database);

  // إنشاء كائن من الـ OrderRepository
  final orderRepository = OrderRepositoryImpl(orderLocalDataSource);

  // تمرير الـ OrderRepository إلى الـ Usecases
  final getOrderHistory = GetOrderHistory(orderRepository);
  final clearOrderHistory = ClearOrderHistory(orderRepository);
  List<OrderModel> initialOrders = []; // يمكنك تعبئة هذه القائمة بالقيم الافتراضية إن وجدت

  runApp(MyApp(
    getOrderHistory: getOrderHistory,
    clearOrderHistory: clearOrderHistory,
    databaseHelper: database,
    orders: initialOrders, // تمرير قائمة الطلبات إلى MyApp
// تمرير DatabaseHelper
  ));
}

class MyApp extends StatelessWidget {
  final GetOrderHistory getOrderHistory;
  final ClearOrderHistory clearOrderHistory;
  final DatabaseHelper databaseHelper;
  final List<OrderModel> orders;

  MyApp({
    required this.getOrderHistory,
    required this.clearOrderHistory,
    required this.databaseHelper, required this.orders,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // قم بتمرير الـ dependencies إلى الـ Cubit
        BlocProvider(create: (context) => OrderSelectionCubit()),
        BlocProvider(create: (context) => OrderCubit(databaseHelper,orders)),

        BlocProvider(
          create: (context) => OrderHistoryCubit(getOrderHistory, clearOrderHistory, databaseHelper),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ActivationPage(),
      ),
    );
  }
}
