import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/produto_provider.dart';
import '../widgets/produto_item.dart';
import 'add_edit_produto.dart';
import '../models/produto.dart';

class ProdutosScreen extends StatefulWidget {
  const ProdutosScreen({Key? key}) : super(key: key);

  @override
  State<ProdutosScreen> createState() => _ProdutosScreenState();
}

class _ProdutosScreenState extends State<ProdutosScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProdutoProvider>(context, listen: false).fetchProdutos();
  }

  @override
  Widget build(BuildContext context) {
    final produtoProvider = Provider.of<ProdutoProvider>(context);
    final produtos = produtoProvider.produtos;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AddEditProdutoScreen()),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (ctx, index) {
          final produto = produtos[index];
          return ProdutoItem(
            produto: produto,
            onRemove: (id) => produtoProvider.removeProduto(id),
            onEdit: (produto) => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => AddEditProdutoScreen(produto: produto),
              ),
            ),
          );
        },
      ),
    );
  }
}
