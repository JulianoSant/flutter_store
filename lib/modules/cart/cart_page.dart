import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_store/stores/cart_store.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartStore = Modular.get<CartStore>();
  final nameController = TextEditingController();

  void _finalizeOrder() {
    if (cartStore.customerName.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Informe o nome do cliente.')));
      return;
    }

    if (cartStore.items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Carrinho vazio.')));
      return;
    }

    Modular.to.pushNamed('/success', arguments: {'name': cartStore.customerName, 'total': cartStore.totalWithDiscount});

    cartStore.clearCart();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    nameController.text = cartStore.customerName;

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
                onChanged: cartStore.setCustomerName,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemCount: cartStore.items.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (_, index) {
                    final item = cartStore.items[index];
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
                  Text('Subtotal: R\$ ${cartStore.totalWithoutDiscount.toStringAsFixed(2)}'),
                  Text('Desconto: ${cartStore.discountPercent}%'),
                  Text(
                    'Total: R\$ ${cartStore.totalWithDiscount.toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: _finalizeOrder,
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
