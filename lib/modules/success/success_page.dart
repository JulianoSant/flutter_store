import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_store/models/order_model.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderModel order = Modular.args.data as OrderModel;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Pedido Confirmado'), automaticallyImplyLeading: false),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_rounded, color: Colors.green, size: 100),

              const SizedBox(height: 24),

              Text(
                'Obrigado, ${order.customerName}!',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              const Text('Seu pedido foi realizado com sucesso.', style: TextStyle(fontSize: 16, color: Colors.grey)),

              const SizedBox(height: 32),

              // Resumo do pedido
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('🔢 Número do pedido: #${order.orderId}'),
                      const SizedBox(height: 8),
                      Text('👤 Cliente: ${order.customerName}'),
                      const SizedBox(height: 8),
                      Text('📦 Itens do pedido:', style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      ...order.items.map((item) => Text('    •   $item')),
                      const SizedBox(height: 12),
                      Text(
                        '💰 Total pago: R\$ ${order.totalPaid.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => Modular.to.navigate('/'),
                  icon: const Icon(Icons.home, color: Colors.white),
                  label: const Text('Voltar à tela inicial', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 16),
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
