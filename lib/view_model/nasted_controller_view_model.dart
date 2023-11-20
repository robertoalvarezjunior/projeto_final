import 'package:routefly/routefly.dart';

import 'package:projeto_final_faculdade/routes.dart';

final class NastedControllerViewModel {
  int calculateSelectedIndex() {
    final String location = Routefly.currentUri.toString();
    if (location.startsWith('/home/produtos')) {
      return 0;
    }
    if (location.startsWith('/home/carrinho')) {
      return 1;
    }
    if (location.startsWith('/home/usuario')) {
      return 2;
    }
    if (location.startsWith('/home/pedidos')) {
      return 3;
    }
    return 0;
  }

  void onItemTapped(int index) {
    switch (index) {
      case 0:
        Routefly.navigate(routePaths.home.produtos);
        break;
      case 1:
        Routefly.navigate(routePaths.home.carrinho);
        break;
      case 2:
        Routefly.navigate(routePaths.home.usuario);
        break;
      case 3:
        Routefly.navigate(routePaths.home.pedidos);
        break;
    }
  }
}
