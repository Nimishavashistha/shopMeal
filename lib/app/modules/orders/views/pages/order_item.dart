import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/data/models/orders.dart';
import 'package:shop_app/app/modules/orders/controllers/order_controller.dart';

class OrderItem extends StatelessWidget {
  final Order order;

  OrderItem({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10),
        child: GetBuilder<OrderController>(
          builder: (controller) => Column(children: [
            ListTile(
              title: Text("\$${order.amount}"),
              subtitle:
                  Text(DateFormat('dd/MM/yyyy hh:mm').format(order.dateTime)),
              trailing: IconButton(
                icon: Icon(controller.expanded
                    ? Icons.expand_less
                    : Icons.expand_more),
                onPressed: () {
                  controller.toggleExpand();
                  print("expanded value = ${controller.expanded}");
                },
              ),
            ),
            if (controller.expanded)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                height: min(order.products.length * 20.0 + 10, 100),
                child: ListView(
                  children: order.products
                      .map((prod) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                prod.title,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${prod.quantity}x \$${prod.price}",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ))
                      .toList(),
                ),
              )
          ]),
        ));
  }
}
