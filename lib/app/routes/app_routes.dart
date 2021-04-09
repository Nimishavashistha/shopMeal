part of 'app_pages.dart';

abstract class AppRoutes {
  static const proOverview = _Paths.proOverview;
  static const proDetails = _Paths.proDetails;
  static const addToCart = _Paths.addToCart;
  static const orderedItems = _Paths.orderedItems;
}

abstract class _Paths {
  static const proOverview = '/product_overview';
  static const proDetails = '/product_details';
  static const addToCart = '/add_to_cart';
  static const orderedItems = '/ordered_item';
}
