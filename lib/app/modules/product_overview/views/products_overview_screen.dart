import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/global_widgets/app_drawer.dart';
import 'package:shop_app/app/modules/cart/controller/cart_controller.dart';

import 'package:shop_app/app/modules/product_overview/controllers/product_overview_controller.dart';
import 'package:shop_app/app/modules/product_overview/views/pages/badge.dart';
import 'package:shop_app/app/modules/product_overview/views/pages/product_item.dart';
import 'package:shop_app/app/routes/route_management.dart';

enum FilterOptions { Favourites, All }

class ProductsOverviewScreen extends StatelessWidget {
  var showFavPro = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MyShop"),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (selectedValue) {
                if (selectedValue == FilterOptions.Favourites) {
                  showFavPro.value = true;
                } else {
                  showFavPro.value = false;
                }
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text("Only Favourites"),
                  value: FilterOptions.Favourites,
                ),
                PopupMenuItem(
                  child: Text("Show All"),
                  value: FilterOptions.All,
                )
              ],
            ),
            Obx(
              () => Badge(
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      RoutesManagement.goToCartScreen();
                    },
                  ),
                  value: Get.find<CartController>().itemCount.toString()),
            )
          ],
        ),
        drawer: AppDrawer(),
        body: GetX<ProductController>(
          builder: (controller) {
            return GridView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: showFavPro.value
                    ? controller.favouriteItems.length
                    : controller.productsList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return ProductItem(
                    product: showFavPro.value
                        ? controller.favouriteItems[index]
                        : controller.productsList[index],
                  );
                });
          },
        ));
  }
}
