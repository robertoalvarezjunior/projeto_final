import 'package:sqflite/sqflite.dart';

import 'package:projeto_final_faculdade/database/local_database.dart';
import 'package:projeto_final_faculdade/model/usuario_model.dart';

final class SelectUsuairo {
  SelectUsuairo();

  late Database db;

  Future<UsuarioModel> selectUsuario(String email, String senha) async {
    try {
      db = await LocalDatabase.instance.database;
      List<Map<String, dynamic>> list = await db.rawQuery(
          'SELECT * from usuario WHERE email = "$email" AND senha = "$senha"');
      if (list.isEmpty) {
        throw Exception("Usuário não encontrado");
      }
      return UsuarioModel.fromMap(list.first);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<UsuarioModel?>> verifyUsuario() async {
    try {
      db = await LocalDatabase.instance.database;
      List<Map<String, dynamic>> list =
          await db.rawQuery('SELECT * from usuario');

      return list.map((e) => UsuarioModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
