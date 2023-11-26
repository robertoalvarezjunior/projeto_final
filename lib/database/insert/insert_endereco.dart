import 'package:sqflite/sqflite.dart';

import 'package:projeto_final_faculdade/database/local_database.dart';
import 'package:projeto_final_faculdade/model/endereco_model.dart';

class InsertEndereco {
  InsertEndereco();

  late Database db;

  Future<void> insertEndereco(
    EnderecoModel? endereco,
  ) async {
    db = await LocalDatabase.instance.database;
    await db.transaction((txt) async {
      await txt.rawInsert(
          'INSERT INTO endereco (idEndereco, rua, cidade, estado, cep, numero, complemento) VALUES (null,?,?,?,?,?,?)',
          [
            endereco?.rua,
            endereco?.cidade,
            endereco?.estado,
            endereco?.cep,
            endereco?.numero,
            endereco?.complemento
          ]);
    });
  }
}
