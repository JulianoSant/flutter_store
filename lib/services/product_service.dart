import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/sandwich_model.dart';
import '../models/extra_model.dart';

class ProductService {
  Future<List<SandwichModel>> getSandwiches() async {
    await Future.delayed(Duration(milliseconds: 300));
    final data = await rootBundle.loadString('assets/mock_data.json');
    final decoded = json.decode(data);
    return (decoded['sandwiches'] as List).map((e) => SandwichModel.fromJson(e)).toList();
  }

  Future<List<ExtraModel>> getExtras() async {
    await Future.delayed(Duration(milliseconds: 300));
    final data = await rootBundle.loadString('assets/mock_data.json');
    final decoded = json.decode(data);
    return (decoded['extras'] as List).map((e) => ExtraModel.fromJson(e)).toList();
  }
}
