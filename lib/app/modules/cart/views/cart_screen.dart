import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/modules/cart/controller/cart_controller.dart';
import 'package:shop_app/app/modules/cart/views/pages/cart_item.dart';
import 'package:shop_app/app/modules/orders/controllers/order_controller.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Obx(() => Chip(
                        label: Text(
                          "\$ ${Get.find<CartController>().totalAmount.toStringAsFixed(2)}",
                          style: TextStyle(
                            color: Theme.of(context)
                                .primaryTextTheme
                                .headline6
                                .color,
                          ),
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                      )),
                  TextButton(
                    onPressed: () {
                      Get.find<OrderController>().addOrder(
                          Get.find<CartController>().cartItems.values.toList(),
                          Get.find<CartController>().totalAmount);
                      Get.find<CartController>().clear();
                    },
                    child: Text(
                      "ORDER NOW",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Obx(
            () => ListView.builder(
              itemCount: Get.find<CartController>().cartItems.length,
              itemBuilder: (ctx, index) => CartItem(
                id: Get.find<CartController>()
                    .cartItems
                    .values
                    .toList()[index]
                    .id,
                productId:
                    Get.find<CartController>().cartItems.keys.toList()[index],
                title: Get.find<CartController>()
                    .cartItems
                    .values
                    .toList()[index]
                    .title,
                price: Get.find<CartController>()
                    .cartItems
                    .values
                    .toList()[index]
                    .price,
                quantity: Get.find<CartController>()
                    .cartItems
                    .values
                    .toList()[index]
                    .quantity,
              ),
            ),
          ))
        ],
      ),
    );
  }
}
