import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_store/models/order_model.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderModel order = Modular.args.data as OrderModel;

    return Scaffold(
      appBar: AppBar(title: const Text('Pedido Realizado'), automaticallyImplyLeading: false),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 72),
              const SizedBox(height: 16),
              Text(
                'Obrigado, ${order.customerName}!',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text('Seu pedido foi finalizado com sucesso.', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              Text(
                'Total pago: R\$ ${order.totalPaid.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16),
              Text('Itens:', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ...order.items.map((item) => Text('- $item')),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () => Modular.to.navigate('/'),
                icon: const Icon(Icons.home),
                label: const Text('Voltar ao Início'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
