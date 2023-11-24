import 'package:bloc/bloc.dart';

import 'package:projeto_final_faculdade/core/utils/getit_setup.dart';
import 'package:projeto_final_faculdade/database/delete/delete_carrinho.dart';
import 'package:projeto_final_faculdade/database/insert/insert_carrinho.dart';
import 'package:projeto_final_faculdade/database/select/select_carrinho.dart';
import 'package:projeto_final_faculdade/model/carrinho_model.dart';
import 'package:projeto_final_faculdade/model/produto_model.dart';

part 'carrinho_event.dart';
part 'carrinho_state.dart';

final class CarrinhoBloc extends Bloc<ICarrinhoEvent, ICarrinhoState> {
  CarrinhoBloc() : super(InitialCarrinhoState()) {
    on<AdicionarItemCarrinhoEvent>(_adicionarItemCarrinho);
    on<RemoverItemCarrinhoEvent>(_removerItemCarrinho);
    on<GetItemsCarrinhoEvent>(_getItemsCarrinho);
  }
  void _adicionarItemCarrinho(
      AdicionarItemCarrinhoEvent event, Emitter<ICarrinhoState> emit) async {
    try {
      await getIt<InsertCarrinho>().insertCarrinho(
          event.produto.nome,
          event.produto.preco,
          event.produto.descricao,
          event.produto.imagem,
          event.produto.tag);
    } catch (e) {
      emit(ErrorCarrinhoState(e.toString()));
    }
  }

  void _removerItemCarrinho(
      RemoverItemCarrinhoEvent event, Emitter<ICarrinhoState> emit) async {
    try {
      await getIt<DeleteCarrinho>()
          .deleteCarrinho(event.id)
          .then((value) => emit(InitialCarrinhoState()))
          .whenComplete(() async {
        emit(InitialCarrinhoState());
        final produtos = await getIt<SelectCarrinho>().selectCarrinho();

        emit(LoadedCarrinhoState(produtos));
        if (produtos.produto!.isEmpty) {
          emit(EmptyCarrinhoState());
        }
      });
    } catch (e) {
      emit(ErrorCarrinhoState(e.toString()));
    }
  }

  void _getItemsCarrinho(
      GetItemsCarrinhoEvent event, Emitter<ICarrinhoState> emit) async {
    try {
      emit(InitialCarrinhoState());
      final produtos = await getIt<SelectCarrinho>().selectCarrinho();

      emit(LoadedCarrinhoState(produtos));
      if (produtos.produto!.isEmpty) {
        emit(EmptyCarrinhoState());
      }
    } catch (e) {
      emit(ErrorCarrinhoState(e.toString()));
    }
  }
}
