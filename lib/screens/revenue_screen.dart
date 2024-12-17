import 'package:flutter/material.dart';
import 'package:receitoteca/models/receita.dart';
import 'package:receitoteca/repositories/repositorio_receita.dart';
import 'package:receitoteca/widgets/ingredients_list.dart';
import 'package:receitoteca/widgets/main_revenue_image.dart';
import 'package:receitoteca/widgets/player_revenue.dart';
import 'package:receitoteca/widgets/revenue_instructions.dart';

class ReceitaScreen extends StatefulWidget {
  final String endpoint;
  const ReceitaScreen({super.key, required this.endpoint});

  @override
  State<ReceitaScreen> createState() => _ReceitaScreenState();
}

class _ReceitaScreenState extends State<ReceitaScreen> {
  late final ReceitaRepositorio repository;
  Receita? receita;

  @override
  void initState() {
    super.initState();
    repository = ReceitaRepositorio(widget.endpoint);
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
            'Receitoteca',
          ),
        ),
        body: receita == null
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      ImagemPrincipalReceita(receita: receita,),

                      ListaIngredientes(receita: receita),

                      InstrucoesReceita(receita: receita),

                      TutorialReceita(receita: receita),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

