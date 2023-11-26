import 'package:sqflite/sqflite.dart';

import 'package:projeto_final_faculdade/database/local_database.dart';

final class DeleteEndereco {
  DeleteEndereco();

  late Database db;

  Future<void> deleteEndereco(int id) async {
    db = await LocalDatabase.instance.database;

    await db.transaction((txn) async {
      await txn.rawDelete('DELETE FROM endereco WHERE idEndereco = ?', [id]);
    });
  }
}
