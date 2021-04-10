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
          leading: GetBuilder<ProductController>(
            builder: (controller) => IconButton(
              color: Theme.of(context).accentColor,
              icon: Icon(controller.findById(product.id).isFavorite
                  ? Icons.favorite_rounded
                  : Icons.favorite_border),
              onPressed: () {
                controller.toggleFavouriteStatus(product.id);
              },
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () {
              Get.find<CartController>()
                  .addItem(product.id, product.price, product.title);
              Get.showSnackbar(GetBar(
                  message: "Added item to cart!",
                  duration: Duration(seconds: 3),
                  mainButton: TextButton(
                    child: Text(
                      "UNDO",
                      style: TextStyle(color: Colors.deepOrange),
                    ),
                    onPressed: () {
                      Get.find<CartController>().removeSingleItem(product.id);
                    },
                  )));
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
