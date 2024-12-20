import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receitoteca/models/provider/receita_random_provider.dart';
import 'package:receitoteca/theme/colors.dart';
import 'package:receitoteca/widgets/widgets_home_screen/card_revenue.dart';

class SorteadorReceita extends StatelessWidget {
  const SorteadorReceita({super.key});

  @override
  Widget build(BuildContext context) {
    final receitaProvider = context.watch<ReceitaRandomProvider>();

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
                onPressed: () {
                  receitaProvider.fetchReceita();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsApp.backgroundPrimario.withOpacity(0.8),
                  padding: const EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 12,
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
              if (receitaProvider.receita != null)
                ReceitaCard(receita: receitaProvider.receita!),
            ],
          ),
        ),
      ),
    );
  }
}
