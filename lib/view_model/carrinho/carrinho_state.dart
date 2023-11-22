part of 'carrinho_bloc.dart';

sealed class ICarrinhoState {
  const ICarrinhoState();
}

final class InitialCarrinhoState extends ICarrinhoState {}

final class LoadingCarrinhoState extends ICarrinhoState {}

final class LoadedCarrinhoState extends ICarrinhoState {
  final List<ProdutoModel> produtos;
  const LoadedCarrinhoState(this.produtos);
}

final class ErrorCarrinhoState extends ICarrinhoState {
  final String message;
  const ErrorCarrinhoState(this.message);
}
