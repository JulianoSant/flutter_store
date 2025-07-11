import 'package:mobx/mobx.dart';

import '../models/cart_item_model.dart';
import '../services/discount_service.dart';

part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {
  final DiscountService discountService;

  _CartStoreBase({required this.discountService});

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
}
