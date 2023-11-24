import 'package:sqflite/sqflite.dart';

import 'package:projeto_final_faculdade/database/local_database.dart';
import 'package:projeto_final_faculdade/model/carrinho_model.dart';
import 'package:projeto_final_faculdade/model/produto_model.dart';

class SelectCarrinho {
  SelectCarrinho();

  late Database db;

  Future<CarrinhoModel> selectCarrinho() async {
    try {
      db = await LocalDatabase.instance.database;
      List<Map<String, dynamic>> list = await db.query('carrinho');

      CarrinhoModel produto = CarrinhoModel(
          produto: list.map((e) => ProdutoModel.fromMap(e)).toList());

      return produto;
    } catch (e) {
      throw Exception(e);
    }
  }
}
