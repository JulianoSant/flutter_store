import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Modular.args.data as Map<String, dynamic>?;

    final name = args?['name'] ?? 'Cliente';
    final total = (args?['total'] ?? 0.0) as double;

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
              Text('Obrigado, $name!', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Seu pedido foi finalizado com sucesso.', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              Text(
                'Total pago: R\$ ${total.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
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
