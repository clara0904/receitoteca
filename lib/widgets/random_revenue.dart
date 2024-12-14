import 'package:flutter/material.dart';
import 'package:receitoteca/models/receita.dart';
import 'package:receitoteca/repositories/repositorio_random.dart';
import 'package:receitoteca/screens/revenue_screen.dart';
import 'package:receitoteca/widgets/card_revenue.dart';

class SorteadorReceita extends StatefulWidget {
  const SorteadorReceita({super.key});

  @override
  State<SorteadorReceita> createState() => _SorteadorReceitaState();
}

class _SorteadorReceitaState extends State<SorteadorReceita> {
  final AleatoriaRepositorio repository = AleatoriaRepositorio();
  Receita? receita;

  void fetchData() async {
    await repository.getReceita();
    setState(() {
      receita = repository.receita; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Não sabe o que fazer para o jantar? \nNão se preocupe, escolhemos para você!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              fetchData();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Descubra sua nova receita',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 8, 70, 120),
              ),
            ),
          ),
          if (receita != null)
            TextButton(
                onPressed: () { 
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ReceitaScreen(endpoint: receita!.meals!.first.idMeal!)
                    )
                  );
                }, 
                child: ReceitaCard(receita: receita)
              ),
        ],
      ),
    );
  }
}

