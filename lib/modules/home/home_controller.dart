import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_store/models/cart_item_model.dart';
import 'package:flutter_store/models/extra_model.dart';
import 'package:flutter_store/models/sandwich_model.dart';
import 'package:flutter_store/services/product_service.dart';
import 'package:flutter_store/stores/cart_store.dart';

class HomeController {
  final productService = ProductService();
  final cartStore = Modular.get<CartStore>();

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
      cartStore.addItem(CartItemModel(productId: id, name: name, price: price, quantity: 1, type: type));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$name adicionado ao carrinho')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
