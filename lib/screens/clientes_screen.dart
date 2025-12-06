import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cliente_provider.dart';
import '../widgets/cliente_item.dart';
import 'add_edit_cliente.dart';
import '../models/cliente.dart';

class ClientesScreen extends StatefulWidget {
  const ClientesScreen({Key? key}) : super(key: key);

  @override
  State<ClientesScreen> createState() => _ClientesScreenState();
}

class _ClientesScreenState extends State<ClientesScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ClienteProvider>(context, listen: false).fetchClientes();
  }

  @override
  Widget build(BuildContext context) {
    final clienteProvider = Provider.of<ClienteProvider>(context);
    final clientes = clienteProvider.clientes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const AddEditClienteScreen()),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: clientes.length,
        itemBuilder: (ctx, index) {
          final cliente = clientes[index];
          return ClienteItem(
            cliente: cliente,
            onRemove: (id) => clienteProvider.removeCliente(id),
            onEdit: (cliente) => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => AddEditClienteScreen(cliente: cliente),
              ),
            ),
          );
        },
      ),
    );
  }
}
