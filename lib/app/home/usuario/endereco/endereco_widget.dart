import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:projeto_final_faculdade/model/endereco_model.dart';
import 'package:projeto_final_faculdade/view_model/endereco/endereco_bloc.dart';
import 'package:projeto_final_faculdade/view_model/endereco/endereco_event.dart';

class EnderecoWidget extends StatelessWidget {
  const EnderecoWidget({super.key, required this.enderecos});

  final List<EnderecoModel> enderecos;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final endereco = enderecos[index];

        return ListTile(
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${endereco.cep}'),
                  Text('${endereco.numero}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          trailing: IconButton(
              onPressed: () {
                context
                    .read<EnderecoBloc>()
                    .add(DeleteEnderecoEvent(endereco.idEndereco!));
              },
              icon: const Icon(Icons.delete)),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: enderecos.length,
    );
  }
}
