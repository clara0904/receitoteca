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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ColorsApp.backgroundSecundario,
            ColorsApp.backgroundTerciario,
          ],
        ),
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: ColorsApp.backgroundPrimario.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  'Deixe o destino escolher seu próximo prato...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: ColorsApp.corFontePrimaria,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: fetchData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsApp.corFonteSecundaria,
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  'Clique e surpreenda-se',
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorsApp.corFontePrimaria,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (receita != null)
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ReceitaScreen(endpoint: receita!.meals!.first.idMeal!),
                      ),
                    );
                  },
                  child: ReceitaCard(receita: receita),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
