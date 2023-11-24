// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

final class UsuarioModel {
  final int? idUsuario;
  final String email;
  final String senha;
  final String nome;
  final String numeroTelefone;

  UsuarioModel({
    this.idUsuario,
    required this.email,
    required this.senha,
    required this.nome,
    required this.numeroTelefone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idUsuario': idUsuario,
      'email': email,
      'senha': senha,
      'nome': nome,
      'numeroTelefone': numeroTelefone,
    };
  }

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      idUsuario: map['idUsuario'] != null ? map['idUsuario'] as int : null,
      email: map['email'] as String,
      senha: map['senha'] as String,
      nome: map['nome'] as String,
      numeroTelefone: map['numeroTelefone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromJson(String source) =>
      UsuarioModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
