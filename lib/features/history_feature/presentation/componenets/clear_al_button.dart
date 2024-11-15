import 'package:cashier_app/features/history_feature/presentation/cubit/order_history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utlis/Widgets/custom_button.dart';

class ClearAllButtonComponent extends StatelessWidget {
  const ClearAllButtonComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: "Clear All",
      onPressed: () {
        context.read<OrderHistoryCubit>().clearOrders();
      },
    );
  }
}
