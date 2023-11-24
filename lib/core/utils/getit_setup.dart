import 'package:get_it/get_it.dart';

import 'package:projeto_final_faculdade/database/delete/delete_carrinho.dart';
import 'package:projeto_final_faculdade/database/insert/insert_carrinho.dart';
import 'package:projeto_final_faculdade/database/insert/insert_usuario.dart';
import 'package:projeto_final_faculdade/database/select/select_carrinho.dart';
import 'package:projeto_final_faculdade/database/select/select_usuario.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<SelectCarrinho>(SelectCarrinho());
  getIt.registerSingleton<InsertCarrinho>(InsertCarrinho());
  getIt.registerSingleton<DeleteCarrinho>(DeleteCarrinho());
  getIt.registerSingleton<InsertUsuario>(InsertUsuario());
  getIt.registerSingleton<SelectUsuairo>(SelectUsuairo());
}
