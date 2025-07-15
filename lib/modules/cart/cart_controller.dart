import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_store/models/cart_item_model.dart';
import 'package:flutter_store/models/order_model.dart';
import 'package:flutter_store/services/discount_service.dart';
import 'package:flutter_store/shared/widgets/app_snack_bar.dart';
import 'package:mobx/mobx.dart';

part 'cart_controller.g.dart';

class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {
  final DiscountService discountService;

  _CartControllerBase({required this.discountService});

  @observable
  ObservableList<CartItemModel> items = ObservableList<CartItemModel>();

  @observable
  String customerName = '';

  @computed
  double get totalWithoutDiscount => items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));

  @computed
  int get discountPercent => discountService.getDiscountPercent(items.toList());

  @computed
  double get totalWithDiscount => discountService.applyDiscount(items.toList());

  @action
  void addItem(CartItemModel item) {
    final alreadyExists = items.any((i) => i.type == item.type);
    if (alreadyExists) {
      throw Exception('Só é permitido um item do tipo "${item.type}"');
    }
    items.add(item);
  }

  @action
  void removeItemByType(String type) {
    items.removeWhere((i) => i.type == type);
  }

  @action
  void clearCart() {
    items.clear();
    customerName = '';
  }

  @action
  void setCustomerName(String name) {
    customerName = name;
  }

  void finalizeOrder(BuildContext context) {
    if (customerName.trim().isEmpty) {
      _showMessage(context, 'Informe o nome do cliente.');
      return;
    }

    if (items.isEmpty) {
      _showMessage(context, 'Carrinho vazio.');
      return;
    }

    final order = OrderModel(
      orderId: DateTime.now().millisecondsSinceEpoch,
      customerName: customerName,
      items: items.map((e) => e.name).toList(),
      totalPaid: totalWithDiscount,
    );

    Modular.to.pushNamed('/success', arguments: order);

    clearCart();
  }

  void _showMessage(BuildContext context, String message) {
    AppSnackBar.show(context, message, type: AppSnackBarType.info, duration: const Duration(seconds: 2));
  }
}
