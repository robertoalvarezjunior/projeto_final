import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:projeto_final_faculdade/view_model/pedido/pedido_bloc.dart';
import 'package:projeto_final_faculdade/view_model/pedido/pedido_event.dart';
import 'package:projeto_final_faculdade/view_model/pedido/pedido_state.dart';

Route routeBuilder(BuildContext context, RouteSettings settings) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (_, a1, a2) => const UsuarioPedidoPage(),
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

class UsuarioPedidoPage extends StatefulWidget {
  const UsuarioPedidoPage({super.key});

  @override
  State<UsuarioPedidoPage> createState() => _UsuarioPedidoPageState();
}

class _UsuarioPedidoPageState extends State<UsuarioPedidoPage> {
  @override
  void initState() {
    context.read<PedidoBloc>().add(const GetPedidoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PedidoBloc, IPedidoState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: switch (state) {
            InitialPedidoState() => const Center(
                child: CircularProgressIndicator(),
              ),
            ErrorPedidoState() => Center(
                child: Text(state.message),
              ),
            LoadedPedidoState() => ListView.separated(
                itemBuilder: (_, index) {
                  final pedido = state.pedidos.produto![index];
                  return ListTile(
                    title: Text(pedido.nome),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(pedido.descricao),
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'R\$ ${pedido.preco.toStringAsFixed(2).replaceAll('.', ',')}',
                                style: const TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    trailing: Image.asset(
                      pedido.imagem,
                    ),
                  );
                },
                separatorBuilder: (_, index) {
                  return const Divider();
                },
                itemCount: state.pedidos.produto!.length),
            EmptyPedidoState() => const Center(
                child: Text('Sem Pedidos'),
              )
          },
        );
      },
    );
  }
}
