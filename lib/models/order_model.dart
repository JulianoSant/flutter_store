class OrderModel {
  final int orderId;
  final String customerName;
  final List<String> items;
  final double totalPaid;

  OrderModel({required this.orderId, required this.customerName, required this.items, required this.totalPaid});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['order_id'],
      customerName: json['customer_name'],
      items: List<String>.from(json['items']),
      totalPaid: (json['total_paid'] as num).toDouble(),
    );
  }
}
