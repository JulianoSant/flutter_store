class ExtraModel {
  final int id;
  final String name;
  final double price;
  final String type;
  final String imagePath;

  ExtraModel({required this.id, required this.name, required this.price, required this.type, required this.imagePath});

  factory ExtraModel.fromJson(Map<String, dynamic> json) {
    return ExtraModel(
      id: json['id'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      type: json['type'],
      imagePath: json['imagePath'],
    );
  }
}
