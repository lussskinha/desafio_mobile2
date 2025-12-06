import 'package:flutter/material.dart';
import 'clientes_screen.dart';
import 'produtos_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Desafio Mobile II'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Clientes'),
              Tab(text: 'Produtos'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ClientesScreen(),
            ProdutosScreen(),
          ],
        ),
      ),
    );
  }
}
