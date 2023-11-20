import 'package:routefly/routefly.dart';

import 'app/app_page.dart' as a0;
import 'app/produtos/produtos_page.dart' as a1;

List<RouteEntity> get routes => [
  RouteEntity(
    key: '/',
    uri: Uri.parse('/'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a0.AppPage(),
    ),
  ),
  RouteEntity(
    key: '/produtos',
    uri: Uri.parse('/produtos'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a1.ProdutosPage(),
    ),
  ),
];

const routePaths = (
  path: '/',
  produtos: '/produtos',
);
