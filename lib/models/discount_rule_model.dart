class DiscountRuleModel {
  final List<String> combo; // Ex: ['sandwich', 'drink']
  final int discountPercent;

  DiscountRuleModel({required this.combo, required this.discountPercent});

  factory DiscountRuleModel.fromJson(Map<String, dynamic> json) {
    return DiscountRuleModel(combo: List<String>.from(json['combo']), discountPercent: json['discount_percent']);
  }
}
