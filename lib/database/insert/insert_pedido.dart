import 'package:sqflite/sqflite.dart';

import 'package:projeto_final_faculdade/database/local_database.dart';
import 'package:projeto_final_faculdade/model/produto_model.dart';

final class InsertPedido {
  InsertPedido();

  late Database db;

  Future<void> insertPedido(List<ProdutoModel> produto) async {
    db = await LocalDatabase.instance.database;
    final batch = db.batch();

    Set<ProdutoModel> set = Set<ProdutoModel>.from(produto);

    List<ProdutoModel> list = set.toSet().toList();

    for (var element in list) {
      batch.insert(
          'pedidos',
          ProdutoModel(
                  idProduto: null,
                  nome: element.nome,
                  preco: element.preco,
                  descricao: element.descricao,
                  imagem: element.imagem,
                  tag: element.tag)
              .toMap());
    }

    await batch.commit(noResult: true);
  }
}
