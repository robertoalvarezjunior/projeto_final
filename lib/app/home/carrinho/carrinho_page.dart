import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:projeto_final_faculdade/app/home/carrinho/carrinho_widget.dart';
import 'package:projeto_final_faculdade/view_model/carrinho/carrinho_bloc.dart';

Route routeBuilder(BuildContext context, RouteSettings settings) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (_, a1, a2) => const CarrinhoPage(),
    transitionsBuilder: (_, a1, a2, child) => child,
  );
}

class CarrinhoPage extends StatefulWidget {
  const CarrinhoPage({super.key});

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  @override
  void initState() {
    super.initState();

    context.read<CarrinhoBloc>().add(const GetItemsCarrinhoEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarrinhoBloc, ICarrinhoState>(
      builder: (context, state) {
        return Scaffold(
          body: switch (state) {
            InitialCarrinhoState() => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ErrorCarrinhoState() => Center(
                child: Text(state.message),
              ),
            LoadedCarrinhoState() => CarrinhoWidget(state: state.produtos),
            EmptyCarrinhoState() => const Center(
                child: Text('Carinho vazio'),
              ),
          },
        );
      },
    );
  }
}
