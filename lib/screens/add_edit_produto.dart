import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/produto_provider.dart';
import '../models/produto.dart';

class AddEditProdutoScreen extends StatefulWidget {
  final Produto? produto;

  const AddEditProdutoScreen({Key? key, this.produto}) : super(key: key);

  @override
  _AddEditProdutoScreenState createState() => _AddEditProdutoScreenState();
}

class _AddEditProdutoScreenState extends State<AddEditProdutoScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _nome;
  late String _preco;

  @override
  void initState() {
    super.initState();
    _nome = widget.produto?.nome ?? '';
    _preco = widget.produto?.preco.toString() ?? '';
  }

  void _saveForm() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    final produtoProvider = Provider.of<ProdutoProvider>(context, listen: false);
    final precoDouble = double.tryParse(_preco) ?? 0.0;

    if (widget.produto == null) {
      produtoProvider.addProduto(Produto(nome: _nome, preco: precoDouble));
    } else {
      produtoProvider.updateProduto(Produto(id: widget.produto!.id, nome: _nome, preco: precoDouble));
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produto == null ? 'Adicionar Produto' : 'Editar Produto'),
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
                initialValue: _preco,
                decoration: const InputDecoration(labelText: 'Preço'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) => value!.isEmpty ? 'Informe o preço' : null,
                onSaved: (value) => _preco = value!,
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
