import 'package:get/get.dart';
import 'package:shop_app/app/modules/orders/controllers/order_controller.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(() => OrderController(), fenix: true);
  }
}
