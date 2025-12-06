import 'package:flutter/material.dart';
import '../models/cliente.dart';

class ClienteItem extends StatelessWidget {
  final Cliente cliente;
  final Function(int) onRemove;
  final Function(Cliente) onEdit;

  const ClienteItem({Key? key, required this.cliente, required this.onRemove, required this.onEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(cliente.nome),
      subtitle: Text(cliente.email),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => onEdit(cliente),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => onRemove(cliente.id!),
          ),
        ],
      ),
    );
  }
}
