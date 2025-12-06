import 'package:flutter/material.dart';
import '../models/produto.dart';

class ProdutoItem extends StatelessWidget {
  final Produto produto;
  final Function(int) onRemove;
  final Function(Produto) onEdit;

  const ProdutoItem({Key? key, required this.produto, required this.onRemove, required this.onEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(produto.nome),
      subtitle: Text('R\$ ${produto.preco.toStringAsFixed(2)}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => onEdit(produto),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => onRemove(produto.id!),
          ),
        ],
      ),
    );
  }
}
