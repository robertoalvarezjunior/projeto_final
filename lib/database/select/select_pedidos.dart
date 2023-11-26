import 'package:sqflite/sqflite.dart';

import 'package:projeto_final_faculdade/database/local_database.dart';
import 'package:projeto_final_faculdade/model/pedido_model.dart';
import 'package:projeto_final_faculdade/model/produto_model.dart';

final class SelectPedidos {
  SelectPedidos();

  late Database db;

  Future<PedidoModel> selectPedidos() async {
    try {
      db = await LocalDatabase.instance.database;

      List<Map<String, dynamic>> list = await db.query('pedidos');

      PedidoModel pedidos = PedidoModel(
          produto: list.map((e) => ProdutoModel.fromMap(e)).toList());

      return pedidos;
    } catch (e) {
      throw Exception(e);
    }
  }
}
