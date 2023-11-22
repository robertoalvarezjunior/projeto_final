import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final class LocalDatabase {
  LocalDatabase._();

  static final LocalDatabase instance = LocalDatabase._();

  static Database? _database;

  get database async {
    if (_database != null) {
      return _database;
    }
    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'cafeteria.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute(_usuario);
    await db.execute(_endereco);
    await db.execute(_carrinho);
  }

  String get _usuario => '''
    CREATE TABLE usuario (
      idUsuario INTEGER  PRIMARY KEY AUTOINCREMENT,
      email TEXT,
      senha TEXT,
      nome TEXT,
      numeroTelefone TEXT
    );
    ''';

  String get _endereco => '''
    CREATE TABLE endereco (
      idEndereco INTEGER  PRIMARY KEY AUTOINCREMENT,
      idUsuario TEXT,
      rua TEXT,
      cidade TEXT,
      estado TEXT,
      cep TEXT,
      numero INTEGER,
      complemento TEXT
    );
  ''';

  String get _carrinho => '''
    CREATE TABLE carrinho (
      idProduto INTEGER  PRIMARY KEY AUTOINCREMENT,
      nome TEXT,
      preco REAL,
      descricao TEXT,
      imagem TEXT,
      tag TEXT
    );
  ''';
}
