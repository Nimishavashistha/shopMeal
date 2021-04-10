import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditProductController extends GetxController {
  final FocusNode _priceFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();
  final FocusNode _imageFocusNode = FocusNode();
  TextEditingController _imageUrlController = TextEditingController();

  get priceFocusNode => this._priceFocusNode;
  get descriptionFocusNode => this._descriptionFocusNode;
  get imageFocusNode => this._imageFocusNode;

  get imageUrlController => this._imageUrlController;

  @override
  void onInit() {
    _imageFocusNode.addListener(_updateImageUrl);
    super.onInit();
  }

  @override
  void dispose() {
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageFocusNode.dispose();
    _imageUrlController.dispose();
    _imageFocusNode.removeListener(_updateImageUrl);
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageFocusNode.hasFocus) {
      update();
    }
  }
}
