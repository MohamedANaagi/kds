// lib/features/summary/presentation/cubit/summary_cubit.dart

import 'package:cashier_app/features/summary/domain/entity/order_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SummaryCubit extends Cubit<OrderStatus> {
  SummaryCubit() : super(OrderStatus(dineInCount: 0, pickupCount: 0, deliveryCount: 0, driveThruCount: 0, allOrdersCount: 0));

  void updateDineInCount(int count) {
    emit(OrderStatus(
      dineInCount: count,
      pickupCount: state.pickupCount,
      deliveryCount: state.deliveryCount,
      driveThruCount: state.driveThruCount,
      allOrdersCount: state.allOrdersCount,
    ));
  }

// Implement other update methods similarly...
}
