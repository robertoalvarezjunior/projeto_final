import 'package:flutter/material.dart';

import 'package:projeto_final_faculdade/app/home/usuario/usuario_widget.dart';

Route routeBuilder(BuildContext context, RouteSettings settings) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (_, a1, a2) => const UsuarioPage(),
    transitionsBuilder: (_, a1, a2, child) => child,
  );
}

class UsuarioPage extends StatelessWidget {
  const UsuarioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UsuarioWidget(),
    );
  }
}
