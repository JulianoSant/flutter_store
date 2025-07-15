import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String name;
  final double price;
  final VoidCallback onTap;
  final String imagePath;

  const ProductCard({super.key, required this.name, required this.price, required this.onTap, required this.imagePath});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  final double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 120),
        scale: _scale,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFF5F5F5)),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(widget.imagePath, fit: BoxFit.cover),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text('R\$ ${widget.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
                const Icon(Icons.add_shopping_cart, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
