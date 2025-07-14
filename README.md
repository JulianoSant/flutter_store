# 🍔 Bom Hambúrguer – App de Pedidos (Flutter)

Aplicativo de pedidos desenvolvido em Flutter como teste técnico, utilizando arquitetura MVC com Flutter Modular e MobX. O usuário pode montar seu pedido com sanduíches, fritas e refrigerante, com descontos aplicados automaticamente de acordo com as combinações escolhidas.

---

## 🚀 Tecnologias Utilizadas

- ✅ **Flutter 3.22.5
- ✅ **Flutter Modular (v6+)**
- ✅ **MobX** (gerenciamento de estado reativo)
- ✅ **MVC** (Model-View-Controller)
- ✅ **Testes unitários com Flutter Test**
- ✅ Dados mockados via `assets/json`

---

## 📱 Funcionalidades

- Listagem de sanduíches e extras (dados mockados)
- Adição dinâmica de itens ao carrinho
- Descontos aplicados com base em regras de combo
- Pagamento fictício (somente nome do cliente)
- Tela de confirmação de pedido
- Validação de entrada e feedback visual

---

## 📁 Estrutura de Pastas

'''lib/
├── app/                            # Arquivo principal do app com Modular (AppModule, AppWidget)
│
├── main.dart                       # Ponto de entrada da aplicação
│
├── models/                         # Modelos de dados usados em todo o app
│   ├── sandwich_model.dart         # Modelo de sanduíche
│   ├── extra_model.dart            # Modelo de extra (fritas/refrigerante)
│   ├── cart_item_model.dart        # Item adicionado ao carrinho
│   ├── order_model.dart            # Dados do pedido finalizado
│   └── discount_rule_model.dart    # Regra de desconto por combo
│
├── services/                       # Regras de negócio e dados mockados
│   ├── product_service.dart        # Leitura de produtos do mock JSON
│   └── discount_service.dart       # Lógica de aplicação de descontos
│
├── shared/
│   └── widgets/                    # Widgets reutilizáveis em todo o app
│       └── product_card.dart       # Componente visual para listar produtos
│
├── modules/
│   ├── home/                       # Tela inicial com listagem de produtos
│   │   ├── home_page.dart
│   │   ├── home_controller.dart
│   │   └── home_module.dart
│
│   ├── cart/                       # Tela do carrinho de compras
│   │   ├── cart_page.dart
│   │   ├── cart_controller.dart    # Store com regras do carrinho
│   │   └── cart_module.dart
│
│   └── success/                    # Tela de sucesso após finalização do pedido
│       ├── success_page.dart
│       └── success_module.dart
│
assets/
└── itens/                          # Imagens mockadas dos produtos
    ├── X-Burger.png
    ├── X-Egg.png
    ├── X-Bacon.png
    ├── Fries.png
    ├── Soft-Drink.png
'''