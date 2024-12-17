import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:receitoteca/models/receita.dart';
import 'package:receitoteca/theme/colors.dart';

class TutorialReceita extends StatelessWidget {
  final Receita? receita;
  const TutorialReceita({super.key, required this.receita});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Visibility(
            visible: receita!.meals!.first.strYoutube!.isNotEmpty,
            child: Row(
              children: [
                const Icon(
                  FontAwesomeIcons.youtube,
                  color: Colors.red,
                  size: 34,
                ),
                const SizedBox(width: 10), 
                Expanded(
                  child: Text(
                    'Acesse o passo a passo no YouTube: \n${receita!.meals!.first.strYoutube}',
                    style: TextStyle(fontSize: 18, color: ColorsApp.corFontePrimaria),
                    overflow: TextOverflow.clip, 
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}