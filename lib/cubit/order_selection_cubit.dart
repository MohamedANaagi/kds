import 'package:flutter_bloc/flutter_bloc.dart';

import '../database/database_helper.dart';
import '../models/history_model.dart';

class OrderSelectionCubit extends Cubit<int?> {
  OrderSelectionCubit() : super(null);

  void selectOrder(int? orderId) {
    emit(orderId);
  }
}



