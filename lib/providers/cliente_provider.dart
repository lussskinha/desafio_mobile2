import 'package:flutter/material.dart';
import '../models/cliente.dart';
import '../services/api_service.dart';

class ClienteProvider extends ChangeNotifier {
  final ApiService _api = ApiService();
  List<Cliente> _clientes = [];

  List<Cliente> get clientes => _clientes;

  Future<void> fetchClientes() async {
    _clientes = await _api.getClientes();
    notifyListeners();
  }

  Future<void> addCliente(Cliente cliente) async {
    await _api.addCliente(cliente);
    await fetchClientes();
  }

  Future<void> updateCliente(Cliente cliente) async {
    await _api.updateCliente(cliente);
    await fetchClientes();
  }

  Future<void> removeCliente(int id) async {
    await _api.removeCliente(id);
    await fetchClientes();
  }
}
