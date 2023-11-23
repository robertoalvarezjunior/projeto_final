part of 'carrinho_bloc.dart';

sealed class ICarrinhoEvent {
  const ICarrinhoEvent();
}

final class AdicionarItemCarrinhoEvent extends ICarrinhoEvent {
  final ProdutoModel produto;
  const AdicionarItemCarrinhoEvent({
    required this.produto,
  });
}

final class RemoverItemCarrinhoEvent extends ICarrinhoEvent {
  final int id;
  const RemoverItemCarrinhoEvent({required this.id});
}

final class GetItemsCarrinhoEvent extends ICarrinhoEvent {
  const GetItemsCarrinhoEvent();
}
