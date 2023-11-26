import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routefly/routefly.dart';

import 'package:projeto_final_faculdade/core/utils/getit_setup.dart';
import 'package:projeto_final_faculdade/database/insert/insert_pedido.dart';
import 'package:projeto_final_faculdade/model/produto_model.dart';
import 'package:projeto_final_faculdade/view_model/carrinho/carrinho_bloc.dart';
import 'package:projeto_final_faculdade/view_model/endereco/endereco_bloc.dart';
import 'package:projeto_final_faculdade/view_model/endereco/endereco_event.dart';
import 'package:projeto_final_faculdade/view_model/endereco/endereco_state.dart';

Route routeBuilder(BuildContext context, RouteSettings settings) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (_, a1, a2) => const DetalhesPedidoPage(),
    transitionsBuilder: (_, a1, a2, child) => child,
  );
}

class DetalhesPedidoPage extends StatefulWidget {
  const DetalhesPedidoPage({super.key});

  @override
  State<DetalhesPedidoPage> createState() => _DetalhesPedidoPageState();
}

class _DetalhesPedidoPageState extends State<DetalhesPedidoPage> {
  @override
  void initState() {
    context.read<CarrinhoBloc>().add(const GetItemsCarrinhoEvent());
    context.read<EnderecoBloc>().add(const GetEnderecosEvent());
    super.initState();
  }

  int enderecoSelecionado = 0;

  @override
  Widget build(BuildContext context) {
    List<ProdutoModel> finalizarCarrinho = [];
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              () async {
                                await getIt<InsertPedido>()
                                    .insertPedido(finalizarCarrinho);
                              }();
                              Routefly.pop(context);
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text('Pix')],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              () async {
                                await getIt<InsertPedido>()
                                    .insertPedido(finalizarCarrinho);
                              }();
                              Routefly.pop(context);
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text('Débito')],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              () async {
                                await getIt<InsertPedido>()
                                    .insertPedido(finalizarCarrinho);
                              }();
                              Routefly.pop(context);
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text('Crédito')],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text('Finalizar Pedido')),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: BlocBuilder<EnderecoBloc, IEnderecoState>(
              builder: (context, state) {
                return switch (state) {
                  InitialEnderecoState() => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ErrorEnderecoState() => Center(
                      child: Text(state.message),
                    ),
                  LoadedEnderecoState() => ListView.separated(
                      itemBuilder: (context, index) {
                        final endereco = state.enderecos[index];
                        return RadioListTile(
                          value: index,
                          groupValue: enderecoSelecionado,
                          onChanged: (int? value) {
                            setState(() {
                              enderecoSelecionado = value!;
                            });
                          },
                          title: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${endereco.cep}'),
                                  Text('${endereco.numero}'),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${endereco.rua}'),
                                  Text('${endereco.cidade}'),
                                  Text('${endereco.estado}'),
                                ],
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('${endereco.complemento}')),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: state.enderecos.length,
                    ),
                  EmptyEnderecoState() => const Center(
                      child: Text('Nenhum endereço cadastrado'),
                    ),
                };
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: BlocBuilder<CarrinhoBloc, ICarrinhoState>(
              builder: (context, state) {
                return switch (state) {
                  InitialCarrinhoState() => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  ErrorCarrinhoState() => Center(
                      child: Text(state.message),
                    ),
                  LoadedCarrinhoState() => ListView.separated(
                      itemBuilder: (context, index) {
                        final carrinho = state.produtos.produto![index];
                        finalizarCarrinho.add(carrinho);

                        return ListTile(
                          title: Text(carrinho.nome),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(carrinho.descricao),
                              Padding(
                                padding: const EdgeInsets.only(top: 24),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'R\$ ${carrinho.preco.toStringAsFixed(2).replaceAll('.', ',')}',
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          trailing: Image.asset(
                            carrinho.imagem,
                            cacheHeight: 147,
                            cacheWidth: 165,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: state.produtos.produto!.length,
                    ),
                  EmptyCarrinhoState() => const Center(
                      child: Text('Carinho vazio'),
                    ),
                };
              },
            ),
          ),
        ],
      ),
    );
  }
}
