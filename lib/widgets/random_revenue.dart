import 'package:flutter/material.dart';
import 'package:receitoteca/models/receita.dart';
import 'package:receitoteca/repositories/repositorio_random.dart';
import 'package:receitoteca/screens/revenue_screen.dart';
import 'package:receitoteca/theme/colors.dart';
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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ColorsApp.backgroundSecundario,
            ColorsApp.backgroundTerciario,
          ],
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(  
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: fetchData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsApp.backgroundPrimario.withOpacity(0.8),
                  padding: const EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 8,
                  shadowColor: Colors.black.withOpacity(0.2),
                ),
                child: Text(
                  'Deixe o destino escolher sua próxima receita...',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: ColorsApp.corFontePrimaria,
                  ),
                ),
              ),
              if (receita != null) ReceitaCard(receita: receita),
            ],
          ),
        ),
      ),
    );
  }
}
