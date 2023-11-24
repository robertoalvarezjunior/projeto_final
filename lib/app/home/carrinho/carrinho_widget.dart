import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:projeto_final_faculdade/consts/produtos_const.dart';
import 'package:projeto_final_faculdade/model/carrinho_model.dart';
import 'package:projeto_final_faculdade/view_model/carrinho/carrinho_bloc.dart';

class CarrinhoWidget extends StatelessWidget {
  const CarrinhoWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  final CarrinhoModel state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Finalizar'),
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          final carrinho = state.produto![index];
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
                                id: carrinho.idProduto,
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
        itemCount: state.produto!.length,
      ),
    );
  }
}
