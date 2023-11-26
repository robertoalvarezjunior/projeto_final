import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:projeto_final_faculdade/app/home/usuario/endereco/endereco_widget.dart';
import 'package:projeto_final_faculdade/view_model/endereco/endereco_bloc.dart';
import 'package:projeto_final_faculdade/view_model/endereco/endereco_event.dart';
import 'package:projeto_final_faculdade/view_model/endereco/endereco_state.dart';

Route routeBuilder(BuildContext context, RouteSettings settings) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (_, a1, a2) => const GetEnderecoPage(),
    transitionsBuilder: (_, a1, a2, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      final offsetAnimation = a1.drive(tween);
      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}

class GetEnderecoPage extends StatefulWidget {
  const GetEnderecoPage({super.key});

  @override
  State<GetEnderecoPage> createState() => _GetEnderecoPageState();
}

class _GetEnderecoPageState extends State<GetEnderecoPage> {
  @override
  void initState() {
    context.read<EnderecoBloc>().add(const GetEnderecosEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnderecoBloc, IEnderecoState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: switch (state) {
            InitialEnderecoState() => const Center(
                child: CircularProgressIndicator(),
              ),
            ErrorEnderecoState() => Center(
                child: Text(state.message),
              ),
            LoadedEnderecoState() => EnderecoWidget(
                enderecos: state.enderecos,
              ),
            EmptyEnderecoState() => const Center(
                child: Text('Nenhum endereço cadastrado'),
              )
          },
        );
      },
    );
  }
}
