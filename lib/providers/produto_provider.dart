import 'package:flutter/material.dart';
import '../models/produto.dart';
import '../services/api_service.dart';

class ProdutoProvider extends ChangeNotifier {
  final ApiService _api = ApiService();
  List<Produto> _produtos = [];

  List<Produto> get produtos => _produtos;

  Future<void> fetchProdutos() async {
    _produtos = await _api.getProdutos();
    notifyListeners();
  }

  Future<void> addProduto(Produto produto) async {
    await _api.addProduto(produto);
    await fetchProdutos();
  }

  Future<void> updateProduto(Produto produto) async {
    await _api.updateProduto(produto);
    await fetchProdutos();
  }

  Future<void> removeProduto(int id) async {
    await _api.removeProduto(id);
    await fetchProdutos();
  }
}
