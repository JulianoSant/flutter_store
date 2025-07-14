import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.name, required this.price, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        elevation: 3,
        child: ListTile(
          title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Text('R\$ ${price.toStringAsFixed(2)}'),
          trailing: const Icon(Icons.add_shopping_cart),
        ),
      ),
    );
  }
}
