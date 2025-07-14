import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_store/modules/cart/cart_controller.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartController = Modular.get<CartController>();
  final nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    nameController.text = cartController.customerName;

    return Scaffold(
      appBar: AppBar(title: const Text('Carrinho')),
      body: Observer(
        builder: (_) => Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nome do cliente'),
                onChanged: cartController.setCustomerName,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemCount: cartController.items.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (_, index) {
                    final item = cartController.items[index];
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text('Tipo: ${item.type}'),
                      trailing: Text('R\$ ${item.price.toStringAsFixed(2)}'),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Subtotal: R\$ ${cartController.totalWithoutDiscount.toStringAsFixed(2)}'),
                  Text('Desconto: ${cartController.discountPercent}%'),
                  Text(
                    'Total: R\$ ${cartController.totalWithDiscount.toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () => cartController.finalizeOrder(context),
                    icon: const Icon(Icons.check),
                    label: const Text('Finalizar Pedido'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
