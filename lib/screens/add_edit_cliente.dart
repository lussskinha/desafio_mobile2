import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cliente_provider.dart';
import '../models/cliente.dart';

class AddEditClienteScreen extends StatefulWidget {
  final Cliente? cliente;

  const AddEditClienteScreen({Key? key, this.cliente}) : super(key: key);

  @override
  _AddEditClienteScreenState createState() => _AddEditClienteScreenState();
}

class _AddEditClienteScreenState extends State<AddEditClienteScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _nome;
  late String _email;

  @override
  void initState() {
    super.initState();
    _nome = widget.cliente?.nome ?? '';
    _email = widget.cliente?.email ?? '';
  }

  void _saveForm() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    final clienteProvider = Provider.of<ClienteProvider>(context, listen: false);
    if (widget.cliente == null) {
      clienteProvider.addCliente(Cliente(nome: _nome, email: _email));
    } else {
      clienteProvider.updateCliente(Cliente(id: widget.cliente!.id, nome: _nome, email: _email));
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cliente == null ? 'Adicionar Cliente' : 'Editar Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _nome,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) => value!.isEmpty ? 'Informe o nome' : null,
                onSaved: (value) => _nome = value!,
              ),
              TextFormField(
                initialValue: _email,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) => value!.isEmpty ? 'Informe o email' : null,
                onSaved: (value) => _email = value!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveForm,
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
