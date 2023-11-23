// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:projeto_final_faculdade/model/produto_model.dart';

final class CarrinhoModel {
  final List<ProdutoModel>? produto;
  CarrinhoModel({
    this.produto,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'produto': produto!.map((x) => x.toMap()).toList(),
    };
  }

  factory CarrinhoModel.fromMap(Map<String, dynamic> map) {
    return CarrinhoModel(
      produto: map['produto'] != null
          ? List<ProdutoModel>.from(
              (map['produto'] as List<int>).map<ProdutoModel?>(
                (x) => ProdutoModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarrinhoModel.fromJson(String source) =>
      CarrinhoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
