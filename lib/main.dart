import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cliente_provider.dart';
import 'providers/produto_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ClienteProvider()),
        ChangeNotifierProvider(create: (_) => ProdutoProvider()),
      ],
      child: MaterialApp(
        title: 'Desafio Mobile II',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomeScreen(),
      ),
    );
  }
}
