import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/global_widgets/app_drawer.dart';
import 'package:shop_app/app/modules/orders/controllers/order_controller.dart';
import 'package:shop_app/app/modules/orders/views/pages/order_item.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      drawer: AppDrawer(),
      body: Obx(() => ListView.builder(
          itemCount: Get.find<OrderController>().orderItems.length,
          itemBuilder: (ctx, index) =>
              OrderItem(order: Get.find<OrderController>().orderItems[index]))),
    );
  }
}
