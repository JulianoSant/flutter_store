class DiscountRuleModel {
  final List<String> combo;
  final int discountPercent;
  final String? imagePath;

  DiscountRuleModel({required this.combo, required this.discountPercent, this.imagePath});

  factory DiscountRuleModel.fromJson(Map<String, dynamic> json) {
    return DiscountRuleModel(
      combo: List<String>.from(json['combo']),
      discountPercent: json['discount_percent'],
      imagePath: json['imagePath'],
    );
  }
}
