import 'package:flutter/material.dart';

import 'package:routefly/routefly.dart';

import 'package:projeto_final_faculdade/view_model/nasted_controller_view_model.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(child: RouterOutlet()),
      bottomNavigationBar: ListenableBuilder(
          listenable: Routefly.listenable,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              showSelectedLabels: true,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.shelves),
                  label: 'Produtos',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_rounded),
                  label: 'Carrinho',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_2),
                  label: 'Usuário',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_rounded),
                  label: 'Pedidos',
                ),
              ],
              currentIndex:
                  NastedControllerViewModel().calculateSelectedIndex(),
              onTap: (value) => NastedControllerViewModel().onItemTapped(value),
            );
          }),
    );
  }
}
