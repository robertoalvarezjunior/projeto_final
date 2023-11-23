import 'package:get_it/get_it.dart';

import 'package:projeto_final_faculdade/database/select/select_carrinho.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<SelectCarrinho>(SelectCarrinho());
}
