class CartItemModel {
  final int productId;
  final String type;
  final String name;
  final double price;
  final int quantity;

  CartItemModel({
    required this.productId,
    required this.type,
    required this.name,
    required this.price,
    required this.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['product_id'],
      type: json['type'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'],
    );
  }
}
