import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routefly/routefly.dart';

import 'package:projeto_final_faculdade/consts/produtos_const.dart';
import 'package:projeto_final_faculdade/model/carrinho_model.dart';
import 'package:projeto_final_faculdade/routes.dart';
import 'package:projeto_final_faculdade/view_model/carrinho/carrinho_bloc.dart';

class CarrinhoWidget extends StatefulWidget {
  const CarrinhoWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  final CarrinhoModel state;

  @override
  State<CarrinhoWidget> createState() => _CarrinhoWidgetState();
}

class _CarrinhoWidgetState extends State<CarrinhoWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () async {
              Routefly.pushNavigate(
                  routePaths.home.carrinho.pedido.detalhesPedido);
            },
            child: const Text('Finalizar'),
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          final carrinho = widget.state.produto![index];
          return ListTile(
            title: Text(carrinho.nome),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(carrinho.descricao),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'R\$ ${carrinho.preco.toStringAsFixed(2).replaceAll('.', ',')}',
                        style: const TextStyle(fontSize: 15),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => context.read<CarrinhoBloc>().add(
                              RemoverItemCarrinhoEvent(
                                id: carrinho.idProduto!,
                              ),
                            ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Remover',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: colorTheme(context).primary),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            trailing: Image.asset(
              carrinho.imagem,
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: widget.state.produto!.length,
      ),
    );
  }
}
