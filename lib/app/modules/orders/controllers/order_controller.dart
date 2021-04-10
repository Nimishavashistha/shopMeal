import 'package:get/get.dart';
import 'package:shop_app/app/data/models/orders.dart';

class OrderController extends GetxController {
  var orderItems = [];
  var expanded = false;

  void toggleExpand() {
    expanded = !expanded;
    update();
  }

  void addOrder(List<dynamic> cartProducts, double total) {
    orderItems.insert(
        0,
        Order(
            id: DateTime.now().toString(),
            amount: total,
            dateTime: DateTime.now(),
            products: cartProducts));
    update();
  }
}
