import 'package:get/get.dart';
import 'package:shop_app/app/modules/edit_products/controller/edit_product_controller.dart';

class EditProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProductController>(() => EditProductController());
  }
}
