import 'package:dio/dio.dart';
import 'package:receitoteca/models/lista_receitas.dart';

class RepositorioReceitas {
  final String endpoint;
  final Dio dio = Dio();

  RepositorioReceitas(this.endpoint);

  String get url => 'https://www.themealdb.com/api/json/v1/1/filter.php?c=$endpoint';

  Future<List<Meals>> getReceitas() async {
  try {
    final response = await dio.get(url);
    List<dynamic> data = response.data['meals'];

    return data.map((json) => Meals.fromJson(json)).toList();
  } catch (e) {
    print('Erro ao buscar receitas: $e');
    return [];
  }
}
}
