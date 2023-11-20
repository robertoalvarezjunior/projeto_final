import 'package:routefly/routefly.dart';

import 'app/app_page.dart' as a0;
import 'app/home/carrinho/carrinho_page.dart' as a1;
import 'app/home/home_layout.dart' as a2;
import 'app/home/pedidos/pedidos_page.dart' as a3;
import 'app/home/produtos/produtos_page.dart' as a4;
import 'app/home/usuario/usuario_page.dart' as a5;

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
    key: '/home/carrinho',
    parent: '/home',
    uri: Uri.parse('/home/carrinho'),
    routeBuilder: a1.routeBuilder,
  ),
  RouteEntity(
    key: '/home',
    uri: Uri.parse('/home'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a2.HomeLayout(),
    ),
  ),
  RouteEntity(
    key: '/home/pedidos',
    parent: '/home',
    uri: Uri.parse('/home/pedidos'),
    routeBuilder: a3.routeBuilder,
  ),
  RouteEntity(
    key: '/home/produtos',
    parent: '/home',
    uri: Uri.parse('/home/produtos'),
    routeBuilder: a4.routeBuilder,
  ),
  RouteEntity(
    key: '/home/usuario',
    parent: '/home',
    uri: Uri.parse('/home/usuario'),
    routeBuilder: a5.routeBuilder,
  ),
];

const routePaths = (
  path: '/',
  home: (
    path: '/home',
    carrinho: '/home/carrinho',
    pedidos: '/home/pedidos',
    produtos: '/home/produtos',
    usuario: '/home/usuario',
  ),
);
