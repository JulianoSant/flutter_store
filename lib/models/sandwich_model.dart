class SandwichModel {
  final int id;
  final String name;
  final double price;
  final String imagePath;

  SandwichModel({required this.id, required this.name, required this.price, required this.imagePath});

  factory SandwichModel.fromJson(Map<String, dynamic> json) {
    return SandwichModel(
      id: json['id'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      imagePath: json['imagePath'],
    );
  }
}
