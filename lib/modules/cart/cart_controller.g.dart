// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartController on _CartControllerBase, Store {
  Computed<double>? _$totalWithoutDiscountComputed;

  @override
  double get totalWithoutDiscount =>
      (_$totalWithoutDiscountComputed ??= Computed<double>(
        () => super.totalWithoutDiscount,
        name: '_CartControllerBase.totalWithoutDiscount',
      )).value;
  Computed<int>? _$discountPercentComputed;

  @override
  int get discountPercent => (_$discountPercentComputed ??= Computed<int>(
    () => super.discountPercent,
    name: '_CartControllerBase.discountPercent',
  )).value;
  Computed<double>? _$totalWithDiscountComputed;

  @override
  double get totalWithDiscount =>
      (_$totalWithDiscountComputed ??= Computed<double>(
        () => super.totalWithDiscount,
        name: '_CartControllerBase.totalWithDiscount',
      )).value;

  late final _$itemsAtom = Atom(
    name: '_CartControllerBase.items',
    context: context,
  );

  @override
  ObservableList<CartItemModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<CartItemModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$customerNameAtom = Atom(
    name: '_CartControllerBase.customerName',
    context: context,
  );

  @override
  String get customerName {
    _$customerNameAtom.reportRead();
    return super.customerName;
  }

  @override
  set customerName(String value) {
    _$customerNameAtom.reportWrite(value, super.customerName, () {
      super.customerName = value;
    });
  }

  late final _$_CartControllerBaseActionController = ActionController(
    name: '_CartControllerBase',
    context: context,
  );

  @override
  void addItem(CartItemModel item) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
      name: '_CartControllerBase.addItem',
    );
    try {
      return super.addItem(item);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItemByType(String type) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
      name: '_CartControllerBase.removeItemByType',
    );
    try {
      return super.removeItemByType(type);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearCart() {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
      name: '_CartControllerBase.clearCart',
    );
    try {
      return super.clearCart();
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCustomerName(String name) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
      name: '_CartControllerBase.setCustomerName',
    );
    try {
      return super.setCustomerName(name);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
customerName: ${customerName},
totalWithoutDiscount: ${totalWithoutDiscount},
discountPercent: ${discountPercent},
totalWithDiscount: ${totalWithDiscount}
    ''';
  }
}
