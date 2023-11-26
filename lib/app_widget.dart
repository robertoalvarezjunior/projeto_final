import 'package:flutter/material.dart';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routefly/routefly.dart';

import 'package:projeto_final_faculdade/routes.dart';
import 'package:projeto_final_faculdade/view_model/carrinho/carrinho_bloc.dart';
import 'package:projeto_final_faculdade/view_model/endereco/endereco_bloc.dart';
import 'package:projeto_final_faculdade/view_model/pedido/pedido_bloc.dart';
import 'package:projeto_final_faculdade/view_model/usuario/usuario_bloc.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final CarrinhoBloc _carrinhoBloc = CarrinhoBloc();
  final UsuarioBloc _usuarioBloc = UsuarioBloc();
  final EnderecoBloc _enderecoBloc = EnderecoBloc();
  final PedidoBloc _pedidoBloc = PedidoBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => _carrinhoBloc),
        BlocProvider(create: (_) => _usuarioBloc),
        BlocProvider(create: (_) => _enderecoBloc),
        BlocProvider(create: (_) => _pedidoBloc),
      ],
      child: MaterialApp.router(
        routerConfig: Routefly.routerConfig(
          routes: routes,
        ),
        title: 'Projeto Final',
        theme: FlexThemeData.light(
          scheme: FlexScheme.orangeM3,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          blendLevel: 7,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 10,
            blendOnColors: false,
            useTextTheme: true,
            useM2StyleDividerInM3: true,
            alignedDropdown: true,
            useInputDecoratorThemeInDialogs: true,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          swapLegacyOnMaterial3: true,
        ),
        darkTheme: FlexThemeData.dark(
          scheme: FlexScheme.orangeM3,
          surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
          blendLevel: 13,
          subThemesData: const FlexSubThemesData(
            blendOnLevel: 20,
            useTextTheme: true,
            useM2StyleDividerInM3: true,
            alignedDropdown: true,
            useInputDecoratorThemeInDialogs: true,
          ),
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          useMaterial3: true,
          swapLegacyOnMaterial3: true,
        ),
        themeMode: ThemeMode.system,
      ),
    );
  }
}
