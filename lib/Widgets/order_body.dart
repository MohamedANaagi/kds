import 'dart:async';
import 'package:cashier_app/Colors/colors.dart';
import 'package:cashier_app/Widgets/custom_button.dart';
import 'package:cashier_app/Widgets/order_row.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../database/database_helper.dart';
import '../models/orders.dart';

class OrderBody extends StatefulWidget {
  const OrderBody({Key? key}) : super(key: key);

  @override
  _OrderBodyState createState() => _OrderBodyState();
}

class _OrderBodyState extends State<OrderBody> {
  List<Order> orders = [];
  final dio = Dio();
  final String cashierIp = "192.168.1.203"; // عنوان IP لجهاز الكاشير
  Timer? timer;
  String? lastFileName;
  final DatabaseHelper dbHelper = DatabaseHelper(); // كائن قاعدة البيانات

  @override
  void initState() {
    super.initState();
    startPolling();
  }

  // بدء التحقق الدوري دون إلغاء التكرار
  void startPolling() {
    timer = Timer.periodic(Duration(seconds: 60), (timer) {
      loadOrderFromCashier();
    });
  }

  // تحميل الملف مع التحقق من أن الملف جديد
  Future<void> loadOrderFromCashier() async {
    try {
      final response = await dio.get('http://$cashierIp:8080/file');

      if (response.statusCode == 200 && response.data != null) {
        final newFileName = response.headers['content-disposition']?.firstWhere(
              (header) => header.contains('filename='),
          orElse: () => '',
        )?.split('filename=')[1]?.replaceAll('"', '');

        if (newFileName != null && newFileName != lastFileName) {
          lastFileName = newFileName;

          final Map<String, dynamic> jsonData = response.data;

          setState(() {
            orders.add(Order.fromJson(jsonData));
          });
          showSnackbar("Order added successfully!");
        }
      }
    } on DioError catch (_) {
      showSnackbar("Network error: Unable to connect to cashier.");
    } catch (e) {
      showSnackbar("Error processing data: $e");
    }
  }

  // دالة لحذف order وإدخاله في قاعدة البيانات
  Future<void> bumpOrder(int index) async {
    final order = orders[index];

    await dbHelper.insertOrder(order); // حفظ الطلب في قاعدة البيانات
    setState(() {
      orders.removeAt(index); // حذف الطلب من القائمة
    });
    showSnackbar("Order bumped and saved to history!");
  }

  // دالة لعرض Snackbar
  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: orders.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Order order = orders[index];
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width * 0.25,
            child: Column(
              children: [
                Card(
                  child: Column(
                    children: [
                      Container(
                        color: AppColor.x,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: order.createdAt.toIso8601String().substring(11, 16), // استخراج الوقت فقط
                              colorindex: 0,
                            ),
                            CustomText(text: "Done (#${order.id})", colorindex: 0,),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: "Serial: ${order.serial}", colorindex: 1,),
                          CustomText(
                            text: order.createdAt.toIso8601String().substring(11, 16),
                            colorindex: 1,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: " Cashier ID: ${order.id}", colorindex: 1,),
                          CustomText(text: "Type: ${order.type}", colorindex: 1,),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: order.orders.length,
                        itemBuilder: (context, productIndex) {
                          OrderItem orderItem = order.orders[productIndex];
                          Product product = orderItem.product;
                          return OrderRow(number: productIndex + 1, title: product.name);
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                CustomButton(
                  title: "Bump",
                  onPressed: () async {
                    await bumpOrder(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final int colorindex;
  final String text;
  const CustomText({Key? key, required this.text, required this.colorindex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.08,
      child: Text(
        text,
        overflow: TextOverflow.fade,
        maxLines: 1,
        style: TextStyle(color: colorindex == 0 ? Colors.white : Colors.black87, fontSize: 20),
      ),
    );
  }
}
