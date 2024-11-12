import 'package:bloc/bloc.dart';

class OrderSelectionCubit extends Cubit<int?> {
  OrderSelectionCubit() : super(null);

  void selectOrder(int? orderId) {
    emit(orderId);
  }
}
