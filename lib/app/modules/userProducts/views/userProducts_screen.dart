import 'package:flutter/material.dart';
import 'package:shop_app/app/global_widgets/app_drawer.dart';
import 'package:shop_app/app/modules/product_overview/controllers/product_overview_controller.dart';
import 'package:shop_app/app/modules/userProducts/views/pages/userProduct_item.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/routes/route_management.dart';

class UserProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Products"),
        actions: [
          IconButton(
              onPressed: () {
                RoutesManagement.goToEditProductsScreen();
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: Get.find<ProductController>().productsList.length,
            itemBuilder: (ctx, index) => Column(
                  children: [
                    UserProductItem(
                      title: Get.find<ProductController>()
                          .productsList[index]
                          .title,
                      imageUrl: Get.find<ProductController>()
                          .productsList[index]
                          .imageUrl,
                    ),
                    Divider(),
                  ],
                )),
      ),
    );
  }
}
