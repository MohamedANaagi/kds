import 'package:flutter_bloc/flutter_bloc.dart';

class OrderSelectionCubit extends Cubit<int?> {
  OrderSelectionCubit() : super(null);

  void selectOrder(int? orderId) {
    emit(orderId);
  }
}
