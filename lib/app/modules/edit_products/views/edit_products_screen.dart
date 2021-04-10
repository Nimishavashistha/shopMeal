import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shop_app/app/modules/edit_products/controller/edit_product_controller.dart';

class EditProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Products"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  Get.find<EditProductController>()
                      .priceFocusNode
                      .requestFocus();
                },
              ),
              TextFormField(
                  decoration: InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  focusNode: Get.find<EditProductController>().priceFocusNode,
                  onFieldSubmitted: (_) {
                    Get.find<EditProductController>()
                        .descriptionFocusNode
                        .requestFocus();
                  }),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode:
                    Get.find<EditProductController>().descriptionFocusNode,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(top: 8, right: 10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: Get.find<EditProductController>()
                              .imageUrlController
                              .text
                              .isEmpty
                          ? Text("Enter a URL")
                          : FittedBox(
                              child: Image.network(
                                Get.find<EditProductController>()
                                    .imageUrlController
                                    .text,
                                fit: BoxFit.cover,
                              ),
                            )),
                  Expanded(
                    child: TextFormField(
                        focusNode:
                            Get.find<EditProductController>().imageFocusNode,
                        decoration: InputDecoration(labelText: 'Image URL'),
                        maxLines: 3,
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: Get.find<EditProductController>()
                            .imageUrlController),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
