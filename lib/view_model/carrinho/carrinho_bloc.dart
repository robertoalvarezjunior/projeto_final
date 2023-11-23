import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:sqflite/sqflite.dart';

import 'package:projeto_final_faculdade/core/utils/getit_setup.dart';
import 'package:projeto_final_faculdade/database/insert_database/insert_carrinho.dart';
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
      InsertCarrinho().insertCarrinho(event.produto.nome, event.produto.preco,
          event.produto.descricao, event.produto.imagem, event.produto.tag);
    } catch (e) {
      emit(ErrorCarrinhoState(e.toString()));
    }
  }

  void _removerItemCarrinho(
      ICarrinhoEvent event, Emitter<ICarrinhoState> emit) {}

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
