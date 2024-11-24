import 'package:flutter/material.dart';
import 'package:receitoteca/models/receita.dart';
import 'package:receitoteca/repositories/repositorio_receita.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ReceitaRepositorio repository = ReceitaRepositorio();
  Receita? receita;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    await repository.getReceita();
    setState(() {
      receita = repository.receita; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'RECEITOTECA',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 214, 213, 213),
        ),
        body: receita == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nome da receita: ${receita!.meals!.first.strMeal}', style: const TextStyle(fontSize: 20)),
                    AspectRatio(
                      aspectRatio: 16 / 9,
                        child: Image.network(
                          receita!.meals!.first.strMealThumb ?? '',
                          height: 200.0,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                    ),
                    Text('Instruções: \n${receita!.meals!.first.strInstructions}', style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
          ),
      ),
    );
  }
}