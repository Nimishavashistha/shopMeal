import 'package:shop_app/app/data/models/cart_item.dart';

class Order {
  final String id;
  final double amount;
  final List<dynamic> products;
  final DateTime dateTime;

  Order({this.id, this.amount, this.products, this.dateTime});
}
