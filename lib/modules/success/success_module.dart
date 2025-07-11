import 'package:flutter_modular/flutter_modular.dart';
import 'success_page.dart';

class SuccessModule extends Module {
  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (_) => const SuccessPage());
  }
}
