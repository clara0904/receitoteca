import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receitoteca/models/provider/receita_provider.dart';
import 'package:receitoteca/widgets/widgets_revenue_screen/ingredients_list.dart';
import 'package:receitoteca/widgets/widgets_revenue_screen/main_revenue_image.dart';
import 'package:receitoteca/widgets/widgets_revenue_screen/player_revenue.dart';
import 'package:receitoteca/widgets/widgets_revenue_screen/revenue_instructions.dart';

class ReceitaScreen extends StatefulWidget {
  final String endpoint;
  const ReceitaScreen({super.key, required this.endpoint});

  @override
  State<ReceitaScreen> createState() => _ReceitaScreenState();
}

class _ReceitaScreenState extends State<ReceitaScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<ReceitaProvider>(context, listen: false)
        .fetchReceita(widget.endpoint);
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
        body: Consumer<ReceitaProvider>(
          builder: (context, receitaProvider, child) {
            final receita = receitaProvider.receita;

            if (receita == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImagemPrincipalReceita(receita: receita),
                    ListaIngredientes(receita: receita),
                    InstrucoesReceita(receita: receita),
                    TutorialReceita(receita: receita),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
