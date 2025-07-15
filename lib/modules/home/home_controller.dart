import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_store/models/cart_item_model.dart';
import 'package:flutter_store/models/extra_model.dart';
import 'package:flutter_store/models/sandwich_model.dart';
import 'package:flutter_store/modules/cart/cart_controller.dart';
import 'package:flutter_store/services/product_service.dart';
import 'package:flutter_store/shared/widgets/app_snack_bar.dart';

class HomeController {
  final productService = ProductService();
  final cartController = Modular.get<CartController>();

  late Future<List<SandwichModel>> sandwichesFuture;
  late Future<List<ExtraModel>> extrasFuture;

  void init() {
    sandwichesFuture = productService.getSandwiches();
    extrasFuture = productService.getExtras();
  }

  void addProductToCart({
    required int id,
    required String name,
    required double price,
    required String type,
    required BuildContext context,
  }) {
    try {
      cartController.addItem(CartItemModel(productId: id, name: name, price: price, quantity: 1, type: type));
      AppSnackBar.show(context, '$name adicionado ao carrinho', type: AppSnackBarType.success);
    } catch (e) {
      AppSnackBar.show(context, e.toString(), type: AppSnackBarType.error);
    }
  }
}
