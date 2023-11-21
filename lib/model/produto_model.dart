import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProdutoModel {
  int idProduto;
  String nome;
  double preco;
  String descricao;
  String imagem;
  String tag;
  ProdutoModel({
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
}
