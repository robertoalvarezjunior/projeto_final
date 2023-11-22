// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:projeto_final_faculdade/consts/produtos_const.dart';
import 'package:projeto_final_faculdade/model/produto_model.dart';
import 'package:projeto_final_faculdade/view_model/carrinho/carrinho_bloc.dart';

class ProdutosWidget extends StatelessWidget {
  const ProdutosWidget({
    Key? key,
    required this.state,
    required this.tipo,
  }) : super(key: key);

  final List<ProdutoModel> state;
  final String tipo;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...state
          .where((element) => element.tag == tipo)
          .map(
            (e) => Column(
              children: [
                ListTile(
                  title: Text(
                    e.nome,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e.descricao),
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'R\$ ${e.preco.toStringAsFixed(2).replaceAll('.', ',')}',
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: () {
                                  ProdutoModel produto = ProdutoModel(
                                    idProduto: e.idProduto,
                                    nome: e.nome,
                                    preco: e.preco,
                                    descricao: e.descricao,
                                    imagem: e.imagem,
                                    tag: e.tag,
                                  );

                                  context.read<CarrinhoBloc>().add(
                                        AdicionarItemCarrinhoEvent(
                                            produto: produto),
                                      );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Adicionar',
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
                  ),
                  trailing: Image.asset(
                    e.imagem,
                    cacheHeight: 147,
                    cacheWidth: 165,
                  ),
                ),
                const Divider(),
              ],
            ),
          )
          .toList(),
    ]);
  }
}
