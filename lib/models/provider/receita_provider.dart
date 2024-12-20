import 'package:flutter/material.dart';
import 'package:receitoteca/models/receita.dart';
import 'package:receitoteca/repositories/repositorio_receita.dart';

class ReceitaProvider extends ChangeNotifier {
  Receita? _receita;

  Receita? get receita => _receita;

  Future<void> fetchReceita(String endpoint) async {
  final repositorio = ReceitaRepositorio(endpoint);

  await repositorio.getReceita();
  _receita = repositorio.receita;
    notifyListeners();
  }
}