import 'package:get/get.dart';
import 'package:shop_app/app/modules/cart/binding/cart_binding.dart';
import 'package:shop_app/app/modules/cart/views/cart_screen.dart';
import 'package:shop_app/app/modules/edit_products/binding/edit_product_binding.dart';
import 'package:shop_app/app/modules/edit_products/views/edit_products_screen.dart';
import 'package:shop_app/app/modules/orders/binding/order_binding.dart';
import 'package:shop_app/app/modules/orders/views/order_screen.dart';
import 'package:shop_app/app/modules/product_details/views/products_details_screen.dart';
import 'package:shop_app/app/modules/product_overview/binding/product_binding.dart';
import 'package:shop_app/app/modules/product_overview/views/products_overview_screen.dart';
import 'package:shop_app/app/modules/userProducts/views/userProducts_screen.dart';
part 'app_routes.dart';

abstract class AppPages {
  static var transitionDuration = const Duration(milliseconds: 300);
  static final pages = <GetPage>[
    GetPage(
        name: _Paths.proOverview,
        page: () => ProductsOverviewScreen(),
        binding: ProductBinding(),
        transitionDuration: transitionDuration),
    GetPage(
        name: _Paths.proDetails,
        page: () => ProductDetailsScreen(),
        transitionDuration: transitionDuration),
    GetPage(
        name: _Paths.addToCart,
        page: () => CartScreen(),
        binding: CartBinding(),
        transitionDuration: transitionDuration),
    GetPage(
        name: _Paths.orderedItems,
        page: () => OrderScreen(),
        binding: OrderBinding(),
        transitionDuration: transitionDuration),
    GetPage(
        name: _Paths.userProducts,
        page: () => UserProductsScreen(),
        binding: ProductBinding(),
        transitionDuration: transitionDuration),
    GetPage(
        name: _Paths.editProduts,
        page: () => EditProductScreen(),
        binding: EditProductBinding(),
        transitionDuration: transitionDuration)
  ];
}
