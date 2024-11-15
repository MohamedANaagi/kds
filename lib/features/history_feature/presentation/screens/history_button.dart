import 'package:cashier_app/features/history_feature/presentation/componenets/history_list.dart';
import 'package:cashier_app/features/history_feature/presentation/componenets/order_details_.dart';
import 'package:cashier_app/features/history_feature/presentation/cubit/order_history_cubit.dart';
import 'package:cashier_app/features/history_feature/presentation/cubit/order_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utlis/Widgets/custom_Icon_button.dart';
import '../../data/models/history_model.dart';
class HistoryButtonScreen extends StatefulWidget {
  const HistoryButtonScreen({Key? key}) : super(key: key);

  @override
  State<HistoryButtonScreen> createState() => _HistoryButtonScreenState();
}

class _HistoryButtonScreenState extends State<HistoryButtonScreen> {
  @override
  void initState() {
    super.initState();
    context.read<OrderHistoryCubit>().loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      isallorder: false,
      text: "History",
      menuItems: [
        BlocConsumer<OrderHistoryCubit, List<HistoryModel>>(
          listener: (context, historyOrders) {},
          builder: (context, historyOrders) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.76,
              width: MediaQuery.of(context).size.width * 0.6,
              child: historyOrders.isEmpty
                  ? Center(
                child: Text(
                  "No orders available. Database is empty.",
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              )
                  : Row(
                children: [
                  // عرض تفاصيل الطلب
                  Expanded(
                    child: OrderDetailsComponent(
                      historyOrders: historyOrders,
                    ),
                  ),
                  // عرض قائمة الطلبات
                  Expanded(
                    child: HistoryListComponent(
                      historyOrders: historyOrders,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

