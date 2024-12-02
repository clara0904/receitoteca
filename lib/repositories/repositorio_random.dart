import 'package:dio/dio.dart';
import 'package:receitoteca/models/receita.dart';

class AleatoriaRepositorio {
  final Dio dio = Dio();
  Receita? receita;

  String get url => 'https://www.themealdb.com/api/json/v1/1/random.php'; 

  Future<void> getReceita() async {
    try {
      final response = await dio.get(url);
      receita = Receita.fromJson(response.data);
    } catch (e) {
      print('Erro ao buscar receita: $e');
    }
  }
}
