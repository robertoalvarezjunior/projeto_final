import 'package:get_it/get_it.dart';

import 'package:projeto_final_faculdade/database/delete/delete_carrinho.dart';
import 'package:projeto_final_faculdade/database/delete/delete_endereco.dart';
import 'package:projeto_final_faculdade/database/insert/insert_carrinho.dart';
import 'package:projeto_final_faculdade/database/insert/insert_endereco.dart';
import 'package:projeto_final_faculdade/database/insert/insert_pedido.dart';
import 'package:projeto_final_faculdade/database/insert/insert_usuario.dart';
import 'package:projeto_final_faculdade/database/select/select_carrinho.dart';
import 'package:projeto_final_faculdade/database/select/select_endereco.dart';
import 'package:projeto_final_faculdade/database/select/select_pedidos.dart';
import 'package:projeto_final_faculdade/database/select/select_usuario.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<InsertCarrinho>(InsertCarrinho());
  getIt.registerSingleton<InsertUsuario>(InsertUsuario());
  getIt.registerSingleton<InsertEndereco>(InsertEndereco());
  getIt.registerSingleton<InsertPedido>(InsertPedido());

  getIt.registerSingleton<SelectCarrinho>(SelectCarrinho());
  getIt.registerSingleton<SelectUsuairo>(SelectUsuairo());
  getIt.registerSingleton<SelectEndereco>(SelectEndereco());
  getIt.registerSingleton<SelectPedidos>(SelectPedidos());

  getIt.registerSingleton<DeleteCarrinho>(DeleteCarrinho());
  getIt.registerSingleton<DeleteEndereco>(DeleteEndereco());
}
