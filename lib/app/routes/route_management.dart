import 'package:get/get.dart';
import 'package:shop_app/app/data/models/product.dart';

import 'app_pages.dart';

abstract class RoutesManagement {
  static void goToProductDetailsScreen(Product product) {
    Get.toNamed<void>(AppRoutes.proDetails, arguments: product);
  }

  static void gotToProductOverviewScreen() {
    Get.toNamed<void>(AppRoutes.proOverview);
  }

  static void goToCartScreen() {
    Get.toNamed<void>(AppRoutes.addToCart);
  }

  static void goToOrderScreen() {
    Get.toNamed<void>(AppRoutes.orderedItems);
  }
}
