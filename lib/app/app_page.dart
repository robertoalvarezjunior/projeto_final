import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';
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
      body: Center(
        child: const Icon(
          Icons.coffee_outlined,
          size: 60,
        )
            .animate(
              onComplete: (_) => Routefly.navigate(routePaths.home.produtos),
            )
            .shake(duration: 1.seconds),
      ),
    );
  }
}
