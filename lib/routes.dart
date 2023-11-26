import 'package:routefly/routefly.dart';

import 'app/app_page.dart' as a0;
import 'app/home/carrinho/carrinho_page.dart' as a1;
import 'app/home/carrinho/pedido/detalhes_pedido_page.dart' as a2;
import 'app/home/home_layout.dart' as a3;
import 'app/home/produtos/produtos_page.dart' as a4;
import 'app/home/usuario/endereco/get_endereco_page.dart' as a5;
import 'app/home/usuario/pedido/acompanhar_pedido_page.dart' as a6;
import 'app/home/usuario/pedido/usuario_pedido_page.dart' as a7;
import 'app/home/usuario/usuario_page.dart' as a8;

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
    key: '/home/carrinho/pedido/detalhes_pedido',
    parent: '/home',
    uri: Uri.parse('/home/carrinho/pedido/detalhes_pedido'),
    routeBuilder: a2.routeBuilder,
  ),
  RouteEntity(
    key: '/home',
    uri: Uri.parse('/home'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a3.HomeLayout(),
    ),
  ),
  RouteEntity(
    key: '/home/produtos',
    parent: '/home',
    uri: Uri.parse('/home/produtos'),
    routeBuilder: a4.routeBuilder,
  ),
  RouteEntity(
    key: '/home/usuario/endereco/get_endereco',
    parent: '/home',
    uri: Uri.parse('/home/usuario/endereco/get_endereco'),
    routeBuilder: a5.routeBuilder,
  ),
  RouteEntity(
    key: '/home/usuario/pedido/acompanhar_pedido',
    parent: '/home',
    uri: Uri.parse('/home/usuario/pedido/acompanhar_pedido'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a6.AcompanharPedidoPage(),
    ),
  ),
  RouteEntity(
    key: '/home/usuario/pedido/usuario_pedido',
    parent: '/home',
    uri: Uri.parse('/home/usuario/pedido/usuario_pedido'),
    routeBuilder: a7.routeBuilder,
  ),
  RouteEntity(
    key: '/home/usuario',
    parent: '/home',
    uri: Uri.parse('/home/usuario'),
    routeBuilder: a8.routeBuilder,
  ),
];

const routePaths = (
  path: '/',
  home: (
    path: '/home',
    carrinho: (
      path: '/home/carrinho',
      pedido: (
        path: '/home/carrinho/pedido',
        detalhesPedido: '/home/carrinho/pedido/detalhes_pedido',
      ),
    ),
    produtos: '/home/produtos',
    usuario: (
      path: '/home/usuario',
      endereco: (
        path: '/home/usuario/endereco',
        getEndereco: '/home/usuario/endereco/get_endereco',
      ),
      pedido: (
        path: '/home/usuario/pedido',
        acompanharPedido: '/home/usuario/pedido/acompanhar_pedido',
        usuarioPedido: '/home/usuario/pedido/usuario_pedido',
      ),
    ),
  ),
);
