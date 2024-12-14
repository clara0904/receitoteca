import 'package:dio/dio.dart';
import 'package:receitoteca/models/categorias.dart';

class RepositorioCategoria {
  final Dio dio = Dio();

  String get url => 'https://www.themealdb.com/api/json/v1/1/categories.php';

  Future<List<Categories>> getCategorias() async {
    try {
      final response = await dio.get(url);
      List<dynamic> data = response.data['categories'];

      return data.map((json) => Categories.fromJson(json)).toList();
    } catch (e) {
      print('Erro ao buscar categorias: $e');
      return [];
    }
  }
}
