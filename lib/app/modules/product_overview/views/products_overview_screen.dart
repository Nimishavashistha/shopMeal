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
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        builder: (controller) => Scaffold(
            appBar: AppBar(
              title: Text("MyShop"),
              actions: <Widget>[
                PopupMenuButton(
                  onSelected: (selectedValue) {
                    if (selectedValue == FilterOptions.Favourites) {
                      controller.toggleMenuItems();
                    } else {
                      controller.toggleMenuItems();
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
                GetBuilder<CartController>(
                    builder: (_controller) => Badge(
                        child: IconButton(
                          icon: Icon(Icons.shopping_cart),
                          onPressed: () {
                            RoutesManagement.goToCartScreen();
                            print(
                              "itemcount = ${_controller.itemCount.toString()}",
                            );
                          },
                        ),
                        value: _controller.itemCount.toString()))
              ],
            ),
            drawer: AppDrawer(),
            body: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: controller.showFavPro
                    ? controller.favouriteItems.length
                    : controller.productsList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return ProductItem(
                    product: controller.showFavPro
                        ? controller.favouriteItems[index]
                        : controller.productsList[index],
                  );
                })));
  }
}
