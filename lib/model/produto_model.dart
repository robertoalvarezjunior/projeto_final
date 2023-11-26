import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProdutoModel extends Equatable {
  final int? idProduto;
  final String nome;
  final double preco;
  final String descricao;
  final String imagem;
  final String tag;
  const ProdutoModel({
    required this.idProduto,
    required this.nome,
    required this.preco,
    required this.descricao,
    required this.imagem,
    required this.tag,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idProduto': idProduto,
      'nome': nome,
      'preco': preco,
      'descricao': descricao,
      'imagem': imagem,
      'tag': tag,
    };
  }

  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoModel(
      idProduto: map['idProduto'] as int,
      nome: map['nome'] as String,
      preco: map['preco'] as double,
      descricao: map['descricao'] as String,
      imagem: map['imagem'] as String,
      tag: map['tag'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdutoModel.fromJson(String source) =>
      ProdutoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [nome];
}
