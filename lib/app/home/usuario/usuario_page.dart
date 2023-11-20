import 'package:flutter/material.dart';

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
      body: Center(
        child: Text('Usuário'),
      ),
    );
  }
}
