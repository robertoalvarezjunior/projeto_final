import 'package:sqflite/sqflite.dart';

import 'package:projeto_final_faculdade/database/local_database.dart';

class InsertCarrinho {
  InsertCarrinho();

  late Database db;

  Future<void> insertCarrinho(
    String nome,
    double preco,
    String descricao,
    String imagem,
    String tag,
  ) async {
    db = await LocalDatabase.instance.database;
    await db.transaction((txt) async {
      await txt.rawInsert(
          'INSERT INTO carrinho (idProduto, nome, preco, descricao, imagem, tag) VALUES (null,?,?,?,?,?)',
          [nome, preco, descricao, imagem, tag]);
    });
  }
}
