import 'package:flutter/material.dart';

import 'package:routefly/routefly.dart';
import 'package:sqflite/sqflite.dart';

import 'package:projeto_final_faculdade/app/home/usuario/endereco/adicionar_endereco_widget.dart';
import 'package:projeto_final_faculdade/routes.dart';

class UsuarioInfosWidget extends StatefulWidget {
  const UsuarioInfosWidget({super.key});

  @override
  State<UsuarioInfosWidget> createState() => _UsuarioInfosWidgetState();
}

class _UsuarioInfosWidgetState extends State<UsuarioInfosWidget> {
  late Database db;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                showDragHandle: true,
                isScrollControlled: true,
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 1),
                builder: (builder) => const AdicionarEnderecoWidgget(),
              );
            },
            child: const ListTile(
              title: Text('Adicionar endereço'),
              leading: Icon(Icons.arrow_right),
            ),
          ),
          GestureDetector(
            onTap: () {
              Routefly.pushNavigate(
                  routePaths.home.usuario.endereco.getEndereco);
            },
            child: const ListTile(
              title: Text('Visualizar endereços cadastrados'),
              leading: Icon(Icons.arrow_right),
            ),
          ),
          GestureDetector(
            onTap: () {
              Routefly.pushNavigate(
                  routePaths.home.usuario.pedido.usuarioPedido);
            },
            child: const ListTile(
              title: Text('Histórico de pedidos'),
              leading: Icon(Icons.arrow_right),
            ),
          ),
        ],
      ),
    );
  }
}
