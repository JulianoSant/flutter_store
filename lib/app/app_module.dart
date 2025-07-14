import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_store/models/discount_rule_model.dart';
import 'package:flutter_store/modules/cart/cart_controller.dart';
import 'package:flutter_store/modules/cart/cart_module.dart';
import 'package:flutter_store/modules/home/home_module.dart';
import 'package:flutter_store/modules/success/success_module.dart';
import 'package:flutter_store/services/discount_service.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(
      () => DiscountService(
        discountRules: [
          DiscountRuleModel(combo: ['sandwich', 'fries', 'drink'], discountPercent: 20),
          DiscountRuleModel(combo: ['sandwich', 'drink'], discountPercent: 15),
          DiscountRuleModel(combo: ['sandwich', 'fries'], discountPercent: 10),
        ],
      ),
    );
    i.addSingleton(() => CartController(discountService: i()));
  }

  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: HomeModule());
    r.module('/cart', module: CartModule());
    r.module('/success', module: SuccessModule());
  }
}
