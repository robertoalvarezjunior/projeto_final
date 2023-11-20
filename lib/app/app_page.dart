import 'package:flutter/material.dart';

import 'package:routefly/routefly.dart';

import 'package:projeto_final_faculdade/routes.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
            onPressed: () => Routefly.push(routePaths.produtos),
            child: const Text('data')),
      ),
    );
  }
}
