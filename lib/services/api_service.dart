import '../models/cliente.dart';
import '../models/produto.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  final List<Cliente> _clientes = [];
  final List<Produto> _produtos = [];
  int _clienteId = 0;
  int _produtoId = 0;

  // CLIENTES
  Future<List<Cliente>> getClientes() async {
    return Future.delayed(const Duration(milliseconds: 300), () => _clientes);
  }

  Future<Cliente> addCliente(Cliente cliente) async {
    cliente.id = ++_clienteId;
    _clientes.add(cliente);
    return cliente;
  }

  Future<Cliente> updateCliente(Cliente cliente) async {
    final index = _clientes.indexWhere((c) => c.id == cliente.id);
    if (index != -1) _clientes[index] = cliente;
    return cliente;
  }

  Future<void> removeCliente(int id) async {
    _clientes.removeWhere((c) => c.id == id);
  }

  // PRODUTOS
  Future<List<Produto>> getProdutos() async {
    return Future.delayed(const Duration(milliseconds: 300), () => _produtos);
  }

  Future<Produto> addProduto(Produto produto) async {
    produto.id = ++_produtoId;
    _produtos.add(produto);
    return produto;
  }

  Future<Produto> updateProduto(Produto produto) async {
    final index = _produtos.indexWhere((p) => p.id == produto.id);
    if (index != -1) _produtos[index] = produto;
    return produto;
  }

  Future<void> removeProduto(int id) async {
    _produtos.removeWhere((p) => p.id == id);
  }
}
