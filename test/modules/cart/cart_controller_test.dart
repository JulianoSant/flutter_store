import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_store/models/cart_item_model.dart';
import 'package:flutter_store/models/discount_rule_model.dart';
import 'package:flutter_store/modules/cart/cart_controller.dart';
import 'package:flutter_store/services/discount_service.dart';

void main() {
  late CartController controller;

  setUp(() {
    final discountService = DiscountService(
      discountRules: [
        DiscountRuleModel(combo: ['sandwich', 'fries', 'drink'], discountPercent: 20),
      ],
    );
    controller = CartController(discountService: discountService);
  });

  test('Adiciona item ao carrinho', () {
    controller.addItem(CartItemModel(productId: 1, name: 'X Burger', price: 5.0, quantity: 1, type: 'sandwich'));

    expect(controller.items.length, 1);
    expect(controller.totalWithoutDiscount, 5.0);
  });

  test('Impede adicionar item duplicado por tipo', () {
    controller.addItem(CartItemModel(productId: 1, name: 'X Burger', price: 5.0, quantity: 1, type: 'sandwich'));

    expect(
      () => controller.addItem(CartItemModel(productId: 2, name: 'X Egg', price: 4.5, quantity: 1, type: 'sandwich')),
      throwsException,
    );
  });

  test('Limpa carrinho e nome', () {
    controller.addItem(CartItemModel(productId: 1, name: 'X Burger', price: 5.0, quantity: 1, type: 'sandwich'));
    controller.setCustomerName('Juliano');

    controller.clearCart();

    expect(controller.items, isEmpty);
    expect(controller.customerName, '');
  });
}
