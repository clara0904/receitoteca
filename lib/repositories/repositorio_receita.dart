import 'package:dio/dio.dart';
import 'package:receitoteca/models/receita.dart';

class ReceitaRepositorio {
  final Dio dio = Dio();
  final String url = 'https://www.themealdb.com/api/json/v1/1/random.php';
  Receita? receita;

  Future<void> getReceita() async{
    try {
      final response = await dio.get(url);
      receita = Receita.fromJson(response.data);
    } catch (e) {
      print('Erro ao buscar receita: $e');
    }
  }
}