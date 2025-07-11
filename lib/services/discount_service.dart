import '../models/cart_item_model.dart';
import '../models/discount_rule_model.dart';

class DiscountService {
  final List<DiscountRuleModel> discountRules;

  DiscountService({required this.discountRules});

  /// Retorna o percentual de desconto com base nos itens do carrinho
  int getDiscountPercent(List<CartItemModel> items) {
    final typesInCart = items.map((e) => e.type).toSet();

    for (final rule in discountRules) {
      final comboSet = rule.combo.toSet();

      if (comboSet.difference(typesInCart).isEmpty && comboSet.length == typesInCart.intersection(comboSet).length) {
        return rule.discountPercent;
      }
    }

    return 0;
  }

  /// Calcula o total com desconto aplicado
  double applyDiscount(List<CartItemModel> items) {
    final total = items.fold<double>(0.0, (sum, item) => sum + (item.price * item.quantity));

    final discountPercent = getDiscountPercent(items);
    final discountAmount = total * (discountPercent / 100);

    return total - discountAmount;
  }
}
