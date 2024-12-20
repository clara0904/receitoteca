import 'package:flutter/material.dart';
import 'package:receitoteca/models/receita.dart';
import 'package:receitoteca/repositories/repositorio_random.dart';

class ReceitaRandomProvider extends ChangeNotifier{
  final AleatoriaRepositorio _repositorio = AleatoriaRepositorio();
  Receita? _receita;

  Receita? get receita => _receita;

  get isLoading => null;

  Future<void> fetchReceita() async {
    await _repositorio.getReceita();
    _receita = _repositorio.receita;
    notifyListeners();
  }
}