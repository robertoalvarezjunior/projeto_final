import 'package:sqflite/sqflite.dart';

import 'package:projeto_final_faculdade/database/local_database.dart';
import 'package:projeto_final_faculdade/model/usuario_model.dart';

final class InsertUsuario {
  InsertUsuario();

  late Database db;

  Future<void> insertUsuario(UsuarioModel usuario) async {
    db = await LocalDatabase.instance.database;

    await db.transaction((txn) async {
      await txn.rawInsert(
        'INSERT INTO usuario(email, senha, nome, numeroTelefone) VALUES(?,?,?,?)',
        [usuario.email, usuario.senha, usuario.nome, usuario.numeroTelefone],
      );
    });
  }
}
