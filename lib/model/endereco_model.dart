// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

final class EnderecoModel {
  final int? idEndereco;
  final String? rua;
  final String? cidade;
  final String? estado;
  final String? cep;
  final int? numero;
  final String? complemento;

  EnderecoModel({
    this.idEndereco,
    this.rua,
    this.cidade,
    this.estado,
    this.cep,
    this.numero,
    this.complemento,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idEndereco': idEndereco,
      'rua': rua,
      'cidade': cidade,
      'estado': estado,
      'cep': cep,
      'numero': numero,
      'complemento': complemento,
    };
  }

  factory EnderecoModel.fromMap(Map<String, dynamic> map) {
    return EnderecoModel(
      idEndereco: map['idEndereco'] != null ? map['idEndereco'] as int : null,
      rua: map['rua'] != null ? map['rua'] as String : null,
      cidade: map['cidade'] != null ? map['cidade'] as String : null,
      estado: map['estado'] != null ? map['estado'] as String : null,
      cep: map['cep'] != null ? map['cep'] as String : null,
      numero: map['numero'] != null ? map['numero'] as int : null,
      complemento:
          map['complemento'] != null ? map['complemento'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EnderecoModel.fromJson(String source) =>
      EnderecoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
