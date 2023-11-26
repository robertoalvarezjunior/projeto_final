import 'package:projeto_final_faculdade/model/pedido_model.dart';

sealed class IPedidoState {
  const IPedidoState();
}

final class InitialPedidoState extends IPedidoState {}

final class LoadedPedidoState extends IPedidoState {
  final PedidoModel pedidos;
  const LoadedPedidoState(this.pedidos);
}

final class ErrorPedidoState extends IPedidoState {
  final String message;
  const ErrorPedidoState(this.message);
}

final class EmptyPedidoState extends IPedidoState {
  const EmptyPedidoState();
}
