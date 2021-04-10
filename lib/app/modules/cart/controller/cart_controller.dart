import 'package:get/get.dart';
import 'package:shop_app/app/data/models/cart_item.dart';

class CartController extends GetxController {
  var cartItems = {};

  get itemCount {
    return cartItems.length;
  }

  get totalAmount {
    var total = 0.0;
    cartItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title) {
    if (cartItems.containsKey(productId)) {
      cartItems.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price));
    } else {
      cartItems.putIfAbsent(
          productId,
          () =>
              CartItem(id: productId, title: title, quantity: 1, price: price));
    }
    update();
  }

  void removeSingleItem(String productId) {
    if (!cartItems.containsKey(productId)) {
      return;
    }
    if (cartItems[productId].quantity > 1) {
      cartItems.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity - 1,
              price: existingCartItem.price));
    } else {
      cartItems.remove(productId);
    }
    update();
  }

  void clear() {
    cartItems = {};
    update();
  }

  void removeItem(String productId) {
    cartItems.remove(productId);
    update();
  }
}
