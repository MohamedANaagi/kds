import 'package:cashier_app/Widgets/number_title_row.dart';
import 'package:cashier_app/features/history_feature/presentation/componenets/order_status_card.dart';
import 'package:cashier_app/features/history_feature/presentation/componenets/recall_button.dart';
import 'package:cashier_app/features/history_feature/presentation/cubit/order_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/history_model.dart';
class OrderDetailsComponent extends StatelessWidget {
  final List<HistoryModel> historyOrders;

  const OrderDetailsComponent({Key? key, required this.historyOrders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderSelectionCubit, int?>(
      builder: (context, selectedOrderId) {
        HistoryModel? selectedOrder = historyOrders.firstWhere(
              (order) => order.id == selectedOrderId,
          orElse: () => historyOrders.isNotEmpty
              ? historyOrders.first
              : HistoryModel(
            id: 0,
            serial: 'null',
            type: 0,
            createdAt: '00:00',
            orders: [],
          ), // إرجاع HistoryModel افتراضي
        );

        return selectedOrder != null
            ? Column(
          children: [
            OrderStatusCardComponent(order: selectedOrder),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: selectedOrder.orders
                      .map(
                        (orderItem) => OrderRow(
                      number: orderItem.quantity.toString(),
                      title: orderItem.product.name,
                      backgroundColor: Colors.transparent,
                      textColor: Colors.grey,
                    ),
                  )
                      .toList(),
                ),
              ),
            ),
            RecallButtonComponent(),
          ],
        )
            : Center(child: Text("Select an order to view details"));
      },
    );
  }
}
