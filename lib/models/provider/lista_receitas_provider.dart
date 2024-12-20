import 'package:flutter/material.dart';
import 'package:receitoteca/models/lista_receitas.dart';
import 'package:receitoteca/repositories/repositorio_receitas.dart';

class ListaReceitasProvider extends ChangeNotifier {
  List<Meals> _receitas = [];

  ListaReceitasProvider(RepositorioReceitas repositorioReceitas);
  List<Meals> get receitas => _receitas;

  Future<void> fetchReceitas(String endpoint) async {
    final repositoryReceitas = RepositorioReceitas(endpoint);
    _receitas = await repositoryReceitas.getReceitas();
    notifyListeners();
  }
}