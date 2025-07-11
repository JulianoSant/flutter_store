import 'package:flutter_modular/flutter_modular.dart';
import 'cart_page.dart';

class CartModule extends Module {
  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (_) => const CartPage());
  }
}
