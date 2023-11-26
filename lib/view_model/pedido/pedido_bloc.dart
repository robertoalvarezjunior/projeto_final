import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:projeto_final_faculdade/core/utils/getit_setup.dart';
import 'package:projeto_final_faculdade/database/select/select_pedidos.dart';
import 'package:projeto_final_faculdade/view_model/pedido/pedido_event.dart';
import 'package:projeto_final_faculdade/view_model/pedido/pedido_state.dart';

final class PedidoBloc extends Bloc<IPedidoEvent, IPedidoState> {
  PedidoBloc() : super(InitialPedidoState()) {
    on<GetPedidoEvent>(_getPedido);
  }

  FutureOr<void> _getPedido(
      GetPedidoEvent event, Emitter<IPedidoState> emit) async {
    try {
      emit(InitialPedidoState());
      final pedidos = await getIt<SelectPedidos>().selectPedidos();

      emit(LoadedPedidoState(pedidos));

      if (pedidos.produto!.isEmpty) {
        emit(const EmptyPedidoState());
      }
    } catch (e) {
      emit(ErrorPedidoState(e.toString()));
    }
  }
}
