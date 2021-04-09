import 'package:get/get.dart';
import 'package:shop_app/app/data/models/cart_item.dart';
import 'package:shop_app/app/data/models/orders.dart';

class OrderController extends GetxController {
  List<Order> _orders = [];
  var orderItems = [].obs;

  void addOrder(List<dynamic> cartProducts, double total) {
    _orders.insert(
        0,
        Order(
            id: DateTime.now().toString(),
            amount: total,
            dateTime: DateTime.now(),
            products: cartProducts));
    orderItems.value = _orders;
  }
}
