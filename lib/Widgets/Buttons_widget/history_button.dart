import 'dart:convert'; // Import for jsonDecode
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/order_selection_cubit.dart';
import '../../database/database_helper.dart';
import '../../models/history_model.dart';
import '../custom_Icon_button.dart';
import '../custom_alert_Dialog.dart';
import '../custom_button.dart';
import '../history_item.dart';
import '../order_row.dart';

class HistoryButton extends StatefulWidget {
  const HistoryButton({super.key});

  @override
  State<HistoryButton> createState() => _HistoryButtonState();
}

class _HistoryButtonState extends State<HistoryButton> {
  List<HistoryModel> historyOrders = [];
  final DatabaseHelper dbHelper = DatabaseHelper();
  HistoryModel? selectedOrder;

  @override
  void initState() {
    super.initState();
    loadHistoryOrders();
  }

  Future<void> loadHistoryOrders() async {
    final orders = await dbHelper.getHistoryOrders();
    setState(() {
      historyOrders = orders;
      if (orders.isNotEmpty) {
        selectedOrder = orders.first;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      isallorder: false,
      text: "History",
      menuItems: [
        Container(
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
              // الجانب الأيسر لعرض تفاصيل الطلب
              Expanded(
                child: BlocBuilder<OrderSelectionCubit, int?>(
                  builder: (context, selectedOrderId) {
                    selectedOrder = historyOrders.firstWhere(
                          (order) => order.id == selectedOrderId,
                      orElse: () => historyOrders.isNotEmpty
                          ? historyOrders.first
                          : HistoryModel(
                        id: 0,
                        serial: "N/A",
                        type: 0,
                        createdAt: "N/A",
                        orders: [],
                      ),
                    );

                    return selectedOrder != null
                        ? Column(
                      children: [
                        Card(
                          child: Column(
                            children: [
                              Container(
                                color: Color(0xFF95A5A5),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      selectedOrder!.createdAt
                                          .substring(11, 16),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      "Done (#${selectedOrder!.id})",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Type: ${selectedOrder!.type}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "Status: Completed",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: selectedOrder!.orders
                                  .map(
                                    (orderItem) => OrderRow(
                                  number: orderItem.quantity,
                                  title: orderItem.product.name,
                                  backgroundColor:
                                  Colors.transparent,
                                  textColor: Colors.grey,
                                ),
                              )
                                  .toList(),
                            ),
                          ),
                        ),
                        CustomButton(
                          title: "Recall",
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomAlertDialog(
                                  title: "Bumb All",
                                  content:
                                  "Are you sure you want to bump all your orders?",
                                  cancelText: "Cancel",
                                  confirmText: "Bumb",
                                  onCancel: () {
                                    Navigator.of(context).pop();
                                  },
                                  onConfirm: () {
                                    Navigator.of(context).pop();
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ],
                    )
                        : Center(
                      child: Text("Select an order to view details"),
                    );
                  },
                ),
              ),
              // الجانب الأيمن لعرض قائمة الطلبات
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: historyOrders.length,
                    itemBuilder: (context, index) {
                      final order = historyOrders[index];
                      return HistoryItem(
                        number: order.id.toString(),
                        onTap: () {
                          context
                              .read<OrderSelectionCubit>()
                              .selectOrder(order.id);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
