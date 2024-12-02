import 'package:dio/dio.dart';
import 'package:receitoteca/models/receita.dart';

class ReceitaRepositorio {
  final String endpoint;
  final Dio dio = Dio();
  Receita? receita;

  ReceitaRepositorio(this.endpoint);

  String get url => 'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$endpoint'; 

  Future<void> getReceita() async {
    try {
      final response = await dio.get(url);
      receita = Receita.fromJson(response.data);
    } catch (e) {
      print('Erro ao buscar receita: $e');
    }
  }
}
