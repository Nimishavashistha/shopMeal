import 'package:get/get.dart';
import 'package:shop_app/app/modules/cart/controller/cart_controller.dart';
import 'package:shop_app/app/modules/product_overview/controllers/product_overview_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
    Get.lazyPut<CartController>(() => CartController());
  }
}
