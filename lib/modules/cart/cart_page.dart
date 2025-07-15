import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_store/modules/cart/cart_controller.dart';
import 'package:flutter_store/shared/widgets/app_snack_bar.dart';

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
                onChanged: cartController.setCustomerName,
                decoration: InputDecoration(
                  labelText: 'Nome do cliente',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
              const SizedBox(height: 16),

              // Lista de itens
              Expanded(
                child: cartController.items.isEmpty
                    ? const Center(child: Text('Seu carrinho está vazio.'))
                    : ListView.builder(
                        itemCount: cartController.items.length,
                        itemBuilder: (context, index) {
                          final item = cartController.items[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            elevation: 3,
                            child: ListTile(
                              title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: Text('Tipo: ${item.type}'),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete_outline, color: Colors.red),
                                onPressed: () {
                                  cartController.removeItemByType(item.type);
                                  AppSnackBar.show(
                                    context,
                                    '${item.name} removido do carrinho',
                                    type: AppSnackBarType.success,
                                    duration: const Duration(seconds: 2),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
              ),

              const SizedBox(height: 8),

              // Área de totais
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Subtotal: R\$ ${cartController.totalWithoutDiscount.toStringAsFixed(2)}'),
                    Text('Desconto: ${cartController.discountPercent}%'),
                    const SizedBox(height: 8),
                    Text(
                      'Total: R\$ ${cartController.totalWithDiscount.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Botão finalizar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => cartController.finalizeOrder(context),
                  icon: const Icon(Icons.check_circle_outline, color: Colors.white),
                  label: const Text('Finalizar Pedido', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.green[600],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
