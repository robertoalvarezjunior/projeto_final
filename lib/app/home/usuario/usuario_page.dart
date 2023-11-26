import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:projeto_final_faculdade/app/home/usuario/usuario_infos_widget.dart';
import 'package:projeto_final_faculdade/app/home/usuario/usuario_widget.dart';
import 'package:projeto_final_faculdade/view_model/usuario/usuario_bloc.dart';
import 'package:projeto_final_faculdade/view_model/usuario/usuario_event.dart';
import 'package:projeto_final_faculdade/view_model/usuario/usuario_state.dart';

Route routeBuilder(BuildContext context, RouteSettings settings) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (_, a1, a2) => const UsuarioPage(),
    transitionsBuilder: (_, a1, a2, child) => child,
  );
}

class UsuarioPage extends StatefulWidget {
  const UsuarioPage({super.key});

  @override
  State<UsuarioPage> createState() => _UsuarioPageState();
}

class _UsuarioPageState extends State<UsuarioPage> {
  @override
  void initState() {
    super.initState();
    context.read<UsuarioBloc>().add(const VerifyUsuarioEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioBloc, IUsuarioState>(
      builder: (context, state) {
        return Scaffold(
          body: switch (state) {
            InitialUsuarioState() => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ErrorUsuarioState() => Center(
                child: Text(state.message),
              ),
            LoggedUsuarioState() => const UsuarioInfosWidget(),
            LoginUsuarioState() => const UsuarioWidget()
          },
        );
      },
    );
  }
}
