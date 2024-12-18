import 'package:flutter/material.dart';
import 'package:receitoteca/models/categorias.dart';
import 'package:receitoteca/repositories/repositorio_categoria.dart';

class CategoriasProvider extends ChangeNotifier{
  final RepositorioCategoria _repositorioCategoria = RepositorioCategoria();
  List<Categories> categorias = [];

  Future<void> fetchCategorias() async {
    categorias = await _repositorioCategoria.getCategorias(); 
    notifyListeners();
  }
}