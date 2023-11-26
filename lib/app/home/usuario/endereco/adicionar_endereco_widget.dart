import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routefly/routefly.dart';

import 'package:projeto_final_faculdade/model/endereco_model.dart';
import 'package:projeto_final_faculdade/view_model/endereco/endereco_bloc.dart';
import 'package:projeto_final_faculdade/view_model/endereco/endereco_event.dart';

class AdicionarEnderecoWidgget extends StatelessWidget {
  const AdicionarEnderecoWidgget({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKeyEndereco = GlobalKey<FormState>();
    final TextEditingController ruaController = TextEditingController();
    final TextEditingController cidadeController = TextEditingController();
    final TextEditingController estadoController = TextEditingController();
    final TextEditingController cepController = TextEditingController();
    final TextEditingController numeroController = TextEditingController();
    final TextEditingController complementoController = TextEditingController();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKeyEndereco,
          child: Column(
            children: [
              TextFormField(
                controller: ruaController,
                decoration: const InputDecoration(labelText: 'Rua'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: cidadeController,
                decoration: const InputDecoration(labelText: 'Cidade'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: estadoController,
                decoration: const InputDecoration(labelText: 'Estado'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: cepController,
                decoration: const InputDecoration(labelText: 'CEP'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: numeroController,
                decoration: const InputDecoration(labelText: 'Número'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: complementoController,
                decoration: const InputDecoration(labelText: 'Complemento'),
              ),
              FilledButton(
                onPressed: () {
                  if (formKeyEndereco.currentState!.validate()) {
                    EnderecoModel endereco = EnderecoModel(
                      rua: ruaController.text,
                      cidade: cidadeController.text,
                      estado: estadoController.text,
                      cep: cepController.text,
                      numero: int.parse(numeroController.text),
                      complemento: complementoController.text,
                    );
                    context
                        .read<EnderecoBloc>()
                        .add(AdicionarEnderecoEvent(endereco));
                    Routefly.pop(context);
                  }
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Cadastrar'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
