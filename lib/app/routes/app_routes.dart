part of 'app_pages.dart';

abstract class AppRoutes {
  static const proOverview = _Paths.proOverview;
  static const proDetails = _Paths.proDetails;
  static const addToCart = _Paths.addToCart;
  static const orderedItems = _Paths.orderedItems;
  static const userProducts = _Paths.userProducts;
  static const editProducts = _Paths.editProduts;
}

abstract class _Paths {
  static const proOverview = '/product_overview';
  static const proDetails = '/product_details';
  static const addToCart = '/add_to_cart';
  static const orderedItems = '/ordered_item';
  static const userProducts = '/user_products';
  static const editProduts = "/edit_products";
}
