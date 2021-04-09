import 'package:get/get.dart';
import 'package:shop_app/app/data/models/cart_item.dart';

class CartController extends GetxController {
  var cartItems = {}.obs;
  var _items = {};

  var totalcartItems = 0.obs;

  get itemCount {
    return totalcartItems;
  }

  get totalAmount {
    var total = 0.0;
    cartItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price));
    } else {
      _items.putIfAbsent(
          productId,
          () =>
              CartItem(id: productId, title: title, quantity: 1, price: price));
    }
    totalcartItems.value = _items.length;
    cartItems.value = _items;
  }

  void clear() {
    cartItems.value = {};
    _items = {};
  }

  void removeItem(String productId) {
    _items.remove(productId);
    cartItems.remove(productId);
  }
}
