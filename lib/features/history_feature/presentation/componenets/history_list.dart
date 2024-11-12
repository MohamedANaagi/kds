import 'package:cashier_app/Widgets/history_item.dart';
import 'package:cashier_app/features/history_feature/presentation/componenets/clear_al_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/history_model.dart';
import '../cubit/order_selection_cubit.dart';

class HistoryListComponent extends StatelessWidget {
  final List<HistoryModel> historyOrders;

  const HistoryListComponent({Key? key, required this.historyOrders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: historyOrders.length,
              itemBuilder: (context, index) {
                final order = historyOrders[index];
                return HistoryItem(
                  number: order.id.toString(),
                  onTap: () {
                    context.read<OrderSelectionCubit>().selectOrder(order.id);
                  },
                );
              },
            ),
            ClearAllButtonComponent(),
          ],
        ),
      ),
    );
  }
}
