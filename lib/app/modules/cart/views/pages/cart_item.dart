import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/modules/cart/controller/cart_controller.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  const CartItem(
      {Key key, this.id, this.productId, this.price, this.quantity, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        builder: (controller) => Dismissible(
              key: ValueKey(id),
              background: Container(
                color: Theme.of(context).errorColor,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 40,
                ),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20),
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              ),
              direction: DismissDirection.endToStart,
              confirmDismiss: (direction) {
                return Get.dialog(AlertDialog(
                  title: Text("Are you sure?"),
                  content:
                      Text("Do you want to remove the item from the cart?"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Get.back(result: false);
                        },
                        child: Text("No")),
                    TextButton(
                        onPressed: () {
                          Get.back(result: true);
                        },
                        child: Text("Yes")),
                  ],
                ));
              },
              onDismissed: (direction) {
                controller.removeItem(productId);
              },
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FittedBox(child: Text("\$ $price")),
                      ),
                    ),
                    title: Text(title),
                    subtitle: Text("Total: \$ ${(price * quantity)}"),
                    trailing: Text("$quantity x"),
                  ),
                ),
              ),
            ));
  }
}
