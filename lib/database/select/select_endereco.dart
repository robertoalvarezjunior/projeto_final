import 'package:sqflite/sqflite.dart';

import 'package:projeto_final_faculdade/database/local_database.dart';
import 'package:projeto_final_faculdade/model/endereco_model.dart';

class SelectEndereco {
  SelectEndereco();

  late Database db;

  Future<List<EnderecoModel>> selectCarrinho() async {
    try {
      db = await LocalDatabase.instance.database;
      List<Map<String, dynamic>> list = await db.query('endereco');

      List<EnderecoModel> endereco =
          list.map((e) => EnderecoModel.fromMap(e)).toList();

      return endereco;
    } catch (e) {
      throw Exception(e);
    }
  }
}
