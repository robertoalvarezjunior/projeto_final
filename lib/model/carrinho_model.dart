import 'package:projeto_final_faculdade/model/produto_model.dart';

final class CarrinhoModel {
  final String? idCarrinho;
  final String idUsuario;
  final ProdutoModel? produto;
  CarrinhoModel({
    this.idCarrinho,
    required this.idUsuario,
    this.produto,
  });
}
