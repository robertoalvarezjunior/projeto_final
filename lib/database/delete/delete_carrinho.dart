import 'package:sqflite/sqflite.dart';

import 'package:projeto_final_faculdade/database/local_database.dart';

class DeleteCarrinho {
  DeleteCarrinho();

  late Database db;

  Future<void> deleteCarrinho(int id) async {
    db = await LocalDatabase.instance.database;
    await db.transaction((txn) async {
      await txn.rawDelete('DELETE FROM carrinho WHERE idProduto = ?', [id]);
    });
  }
}
