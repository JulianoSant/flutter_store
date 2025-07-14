import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_store/models/cart_item_model.dart';
import 'package:flutter_store/models/discount_rule_model.dart';
import 'package:flutter_store/services/discount_service.dart';

void main() {
  late DiscountService service;

  setUp(() {
    service = DiscountService(
      discountRules: [
        DiscountRuleModel(combo: ['sandwich', 'fries', 'drink'], discountPercent: 20),
        DiscountRuleModel(combo: ['sandwich', 'drink'], discountPercent: 15),
        DiscountRuleModel(combo: ['sandwich', 'fries'], discountPercent: 10),
      ],
    );
  });

  test('Desconto de 20% para combo completo', () {
    final cart = [
      CartItemModel(productId: 1, name: 'X Burger', price: 5.0, quantity: 1, type: 'sandwich'),
      CartItemModel(productId: 101, name: 'Fries', price: 2.0, quantity: 1, type: 'fries'),
      CartItemModel(productId: 102, name: 'Drink', price: 2.5, quantity: 1, type: 'drink'),
    ];
    expect(service.getDiscountPercent(cart), 20);
    expect(service.applyDiscount(cart), 7.60);
  });

  test('Desconto de 15% para sanduíche e bebida', () {
    final cart = [
      CartItemModel(productId: 1, name: 'X Burger', price: 5.0, quantity: 1, type: 'sandwich'),
      CartItemModel(productId: 102, name: 'Drink', price: 2.5, quantity: 1, type: 'drink'),
    ];
    expect(service.getDiscountPercent(cart), 15);
    expect(service.applyDiscount(cart), 6.375);
  });

  test('Sem desconto com item único', () {
    final cart = [CartItemModel(productId: 1, name: 'X Burger', price: 5.0, quantity: 1, type: 'sandwich')];
    expect(service.getDiscountPercent(cart), 0);
    expect(service.applyDiscount(cart), 5.0);
  });
}
