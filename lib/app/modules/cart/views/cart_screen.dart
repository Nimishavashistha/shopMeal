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
        body: GetBuilder<CartController>(
          builder: (controller) => Column(
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
                      Chip(
                        label: Text(
                          "\$ ${controller.totalAmount.toStringAsFixed(2)}",
                          style: TextStyle(
                            color: Theme.of(context)
                                .primaryTextTheme
                                .headline6
                                .color,
                          ),
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.find<OrderController>().addOrder(
                              controller.cartItems.values.toList(),
                              controller.totalAmount);
                          controller.clear();
                        },
                        child: Text(
                          "ORDER NOW",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
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
                child: ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (ctx, index) => CartItem(
                    id: controller.cartItems.values.toList()[index].id,
                    productId: controller.cartItems.keys.toList()[index],
                    title: controller.cartItems.values.toList()[index].title,
                    price: controller.cartItems.values.toList()[index].price,
                    quantity:
                        controller.cartItems.values.toList()[index].quantity,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
