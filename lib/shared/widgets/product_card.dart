// import 'package:flutter/material.dart';

// class ProductCard extends StatelessWidget {
//   final String name;
//   final double price;
//   final VoidCallback onTap;

//   const ProductCard({super.key, required this.name, required this.price, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Card(
//         margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//         elevation: 3,
//         child: ListTile(
//           title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
//           subtitle: Text('R\$ ${price.toStringAsFixed(2)}'),
//           trailing: const Icon(Icons.add_shopping_cart),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final VoidCallback onTap;
  final String imagePath;

  const ProductCard({super.key, required this.name, required this.price, required this.onTap, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
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
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),

              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('R\$ ${price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              const Icon(Icons.add_shopping_cart, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
