import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:sqflite/sqflite.dart';

import 'package:projeto_final_faculdade/database/local_database.dart';

Route routeBuilder(BuildContext context, RouteSettings settings) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (_, a1, a2) => const CarrinhoPage(),
    transitionsBuilder: (_, a1, a2, child) => child,
  );
}

class CarrinhoPage extends StatefulWidget {
  const CarrinhoPage({super.key});

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  late Database db;
  @override
  void initState() {
    super.initState();
    () async {
      db = await LocalDatabase.instance.database;
      // fazer um teste disso
      List<Map> list = await db.rawQuery('SELECT * FROM carrinho');
      log(list.toString());
      print(list.toString());
    }();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Carrinho')),
    );
  }
}
