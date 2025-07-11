class SandwichModel {
  final int id;
  final String name;
  final double price;

  SandwichModel({required this.id, required this.name, required this.price});

  factory SandwichModel.fromJson(Map<String, dynamic> json) {
    return SandwichModel(id: json['id'], name: json['name'], price: (json['price'] as num).toDouble());
  }
}
