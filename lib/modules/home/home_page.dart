import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_store/models/extra_model.dart';
import 'package:flutter_store/models/sandwich_model.dart';
import 'package:flutter_store/modules/home/home_controller.dart';
import 'package:flutter_store/services/product_service.dart';
import 'package:flutter_store/shared/widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final productService = ProductService();
  final homeController = Modular.get<HomeController>();

  late Future<List<SandwichModel>> sandwichesFuture;
  late Future<List<ExtraModel>> extrasFuture;

  @override
  void initState() {
    super.initState();
    homeController.init();
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
              future: homeController.sandwichesFuture,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                return Column(
                  children: snapshot.data!
                      .map(
                        (s) => ProductCard(
                          name: s.name,
                          price: s.price,
                          onTap: () => homeController.addProductToCart(
                            id: s.id,
                            name: s.name,
                            price: s.price,
                            type: 'sandwich',
                            context: context,
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text('Extras', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            FutureBuilder<List<ExtraModel>>(
              future: homeController.extrasFuture,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                return Column(
                  children: snapshot.data!
                      .map(
                        (e) => ProductCard(
                          name: e.name,
                          price: e.price,
                          onTap: () => homeController.addProductToCart(
                            id: e.id,
                            name: e.name,
                            price: e.price,
                            type: e.type,
                            context: context,
                          ),
                        ),
                      )
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
