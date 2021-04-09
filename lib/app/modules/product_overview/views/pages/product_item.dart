import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/data/models/product.dart';
import 'package:shop_app/app/modules/cart/controller/cart_controller.dart';
import 'package:shop_app/app/modules/product_overview/controllers/product_overview_controller.dart';
import 'package:shop_app/app/routes/route_management.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            RoutesManagement.goToProductDetailsScreen(product);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: Obx(() => IconButton(
                color: Theme.of(context).accentColor,
                icon: product.isFavorite.value
                    ? Icon(Icons.favorite_rounded)
                    : Icon(Icons.favorite_border),
                onPressed: () {
                  product.isFavorite.toggle();
                },
              )),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () {
              Get.find<CartController>()
                  .addItem(product.id, product.price, product.title);
            },
          ),
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
