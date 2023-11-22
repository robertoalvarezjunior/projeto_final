import 'package:bloc/bloc.dart';
import 'package:sqflite/sqflite.dart';

import 'package:projeto_final_faculdade/database/local_database.dart';
import 'package:projeto_final_faculdade/model/produto_model.dart';

part 'carrinho_event.dart';
part 'carrinho_state.dart';

final class CarrinhoBloc extends Bloc<ICarrinhoEvent, ICarrinhoState> {
  CarrinhoBloc() : super(InitialCarrinhoState()) {
    on<AdicionarItemCarrinhoEvent>(_adicionarItemCarrinho);
    on<RemoverItemCarrinhoEvent>(_removerItemCarrinho);
  }

  late Database db;

  void _adicionarItemCarrinho(
      AdicionarItemCarrinhoEvent event, Emitter<ICarrinhoState> emit) async {
    try {
      db = await LocalDatabase.instance.database;
      await db.transaction((txt) async {
        await txt.rawInsert(
            'INSERT INTO carrinho (nome, preco, descricao, imagem, tag) VALUES (?,?,?,?,?)',
            [
              event.produto.nome,
              event.produto.preco,
              event.produto.descricao,
              event.produto.imagem,
              event.produto.tag
            ]);
      });
    } catch (e) {
      emit(ErrorCarrinhoState(e.toString()));
    }
  }

  void _removerItemCarrinho(
      ICarrinhoEvent event, Emitter<ICarrinhoState> emit) {}
}
