import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:sqflite/sqflite.dart';

import 'package:projeto_final_faculdade/app/home/produtos/produtos_categoria.dart';
import 'package:projeto_final_faculdade/app/home/produtos/produtos_widget.dart';
import 'package:projeto_final_faculdade/consts/produtos_const.dart';
import 'package:projeto_final_faculdade/database/local_database.dart';
import 'package:projeto_final_faculdade/model/carrinho_model.dart';
import 'package:projeto_final_faculdade/model/produto_model.dart';

Route routeBuilder(BuildContext context, RouteSettings settings) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (_, a1, a2) => const ProdutosPage(),
    transitionsBuilder: (_, a1, a2, child) => child,
  );
}

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({super.key});

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  final List<GlobalKey> categorias = [GlobalKey(), GlobalKey(), GlobalKey()];
  BuildContext? tabContext;
  late ScrollController scrollController;

  late Database db;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_changeTabs);
    super.initState();
  }

  _scrollTo(int index) async {
    scrollController.removeListener(_changeTabs);
    final categoria = categorias[index].currentContext!;

    await Scrollable.ensureVisible(categoria,
        duration: const Duration(milliseconds: 600));
    scrollController.addListener(_changeTabs);
  }

  _changeTabs() {
    late RenderBox box;

    for (var i = 0; i < categorias.length; i++) {
      box = categorias[i].currentContext!.findRenderObject() as RenderBox;
      Offset position = box.localToGlobal(Offset.zero);

      if (scrollController.offset >= position.dy) {
        DefaultTabController.of(tabContext!)
            .animateTo(i, duration: const Duration(milliseconds: 100));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Builder(builder: (context) {
        tabContext = context;
        return Scaffold(
          appBar: TabBar(
            dividerColor: Colors.transparent,
            tabs: const [
              Tab(child: Text('Café')),
              Tab(child: Text('Chá')),
              Tab(child: Text('Bolo')),
            ],
            onTap: (index) => _scrollTo(index),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  ProdutosCategoria(
                      categoriaKey: categorias[0], categoria: 'Café'),
                  ProdutosWidget(
                      state: cafe.map((e) => ProdutoModel.fromMap(e)).toList(),
                      tipo: 'cafe'),
                  ProdutosCategoria(
                      categoriaKey: categorias[1], categoria: 'Chá'),
                  ProdutosWidget(
                      state: cha.map((e) => ProdutoModel.fromMap(e)).toList(),
                      tipo: 'cha'),
                  ProdutosCategoria(
                      categoriaKey: categorias[2], categoria: 'Bolo'),
                  ProdutosWidget(
                      state: bolo.map((e) => ProdutoModel.fromMap(e)).toList(),
                      tipo: 'bolo'),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
