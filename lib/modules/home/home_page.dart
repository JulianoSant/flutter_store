import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_store/models/cart_item_model.dart';
import 'package:flutter_store/models/extra_model.dart';
import 'package:flutter_store/models/sandwich_model.dart';
import 'package:flutter_store/services/product_service.dart';
import 'package:flutter_store/stores/cart_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final productService = ProductService();
  final cartStore = Modular.get<CartStore>();

  late Future<List<SandwichModel>> sandwichesFuture;
  late Future<List<ExtraModel>> extrasFuture;

  @override
  void initState() {
    super.initState();
    sandwichesFuture = productService.getSandwiches();
    extrasFuture = productService.getExtras();
  }

  void _addProductToCart({required int id, required String name, required double price, required String type}) {
    try {
      cartStore.addItem(CartItemModel(productId: id, name: name, price: price, quantity: 1, type: type));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$name adicionado ao carrinho')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Widget _buildProductCard({required String name, required double price, required String type, required int id}) {
    return GestureDetector(
      onTap: () {
        _addProductToCart(id: id, name: name, price: price, type: type);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        child: ListTile(
          title: Text(name),
          subtitle: Text('R\$ ${price.toStringAsFixed(2)}'),
          trailing: Icon(Icons.add_shopping_cart),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bom Hambúrguer'),
        actions: [IconButton(icon: Icon(Icons.shopping_cart), onPressed: () => Modular.to.pushNamed('/cart'))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text('Sanduíches', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            FutureBuilder<List<SandwichModel>>(
              future: sandwichesFuture,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                return Column(
                  children: snapshot.data!
                      .map((s) => _buildProductCard(id: s.id, name: s.name, price: s.price, type: 'sandwich'))
                      .toList(),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text('Extras', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            FutureBuilder<List<ExtraModel>>(
              future: extrasFuture,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                return Column(
                  children: snapshot.data!
                      .map((e) => _buildProductCard(id: e.id, name: e.name, price: e.price, type: e.type))
                      .toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
